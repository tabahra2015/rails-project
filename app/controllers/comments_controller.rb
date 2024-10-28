class CommentsController < ApplicationController
    before_action :set_commentable
  
    def new
      @comment = @commentable.comments.new
    end
  
    def create
      @comment = @commentable.comments.new(comment_params)
      if @comment.save
        redirect_to @commentable, notice: "Comment was successfully created."
      else
        render :new
      end
    end
  
    private
  
    def set_commentable
      # Detects whether we're adding a comment to a post or an event
      if params[:post_id]
        @commentable = Post.find(params[:post_id])
      elsif params[:event_id]
        @commentable = Event.find(params[:event_id])
      end
    end
  
    def comment_params
      params.require(:comment).permit(:content)
    end
  end
  