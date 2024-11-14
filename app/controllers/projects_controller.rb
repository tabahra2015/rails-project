class ProjectsController < ApplicationController
    before_action :set_project, only: [:show, :edit, :update, :destroy]
  
    def index
      @projects = Project.all
    end
  
    def show
      @project = Project.find(params[:id])
      @review = @project.reviews.new 
      @tasks = @project.tasks
    end
    
    def new
      @project = Project.new
    end
  
    def create
      @project = Project.new(project_params)
      if @project.save
        redirect_to project_path(@project)
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    def edit
      @project = Project.find(params[:id])
    end
  
    def update
      if @project.update(project_params)
        redirect_to project_path(@project)
      else
        render :edit, status: :unprocessable_entity
      end
    end
   

    def destroy
      @project = Project.find(params[:id])
      @project.destroy
      redirect_to projects_path, notice: 'Project was successfully deleted.'
    end
    

    private
  
    def set_project
      @project = Project.find(params[:id])
    end
  
    def project_params
      params.require(:project).permit(:name, :description, :deadline)
    end
    

  end
  