class TasksController < ApplicationController

  
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
    @projects = Project.all # Fetch all projects to allow selection
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task, notice: 'Task was successfully created.'
    else
      flash.now[:alert] = 'There was an error creating the task.'
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
    @projects = Project.all # Fetch projects for the project selection
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to task_path(@task)
    else
      @projects = Project.all # Fetch projects again in case of validation errors
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :status, :project_id, :progress) # Add :progress to the permitted params
  end
end
