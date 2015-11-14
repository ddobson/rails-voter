class CommentsController < ApplicationController
  def edit
    @comment = Comment.find(params[:id])
  end

  def update 
    @comment = Comment.find(params[:id])
    @comment.update get_safe_params(params)
    redirect_to "/#{@comment.commentable_type.downcase.pluralize}/#{@comment.commentable_id}"
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to :back
  end

  def upvote
    @comment = Comment.find(params[:id])
    @comment.upvote_from current_user
    redirect_to :back
  end

  def downvote
    @comment = Comment.find(params[:id])
    @comment.downvote_from current_user
    redirect_to :back
  end

  private
    def get_safe_params(params)
    params.require(:comment).permit(:id, :body)
  end
end