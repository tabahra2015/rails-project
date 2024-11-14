class ReviewsController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @review = @project.reviews.new(review_params)

    if @review.save
      redirect_to project_path(@project)
    else
      render 'projects/show', status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @project = @review.project
    @review.destroy
    redirect_to project_path(@project)
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
