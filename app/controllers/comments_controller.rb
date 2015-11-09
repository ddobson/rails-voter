class CommentsController < ApplicationController
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
    params.require(:comment).permit(:id)
  end
end