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

  def reply
    @parent_comment = Comment.find(params[:id])
  end

  def reply_to_comment
    @parent_comment = Comment.find(params[:id])
    @user_who_commented = current_user
    @comment = Comment.build_from( Post.find(@parent_comment.commentable_id), @user_who_commented.id, params[:body] )
    @comment.save
    @comment.move_to_child_of(@parent_comment)
    redirect_to "/#{@parent_comment.commentable_type.downcase.pluralize}/#{@parent_comment.commentable_id}"
  end

  private
    def get_safe_params(params)
    params.require(:comment).permit(:id, :body)
  end
end