class PostsController < ApplicationController
  before_filter :authenticate_user!,
    :only => [:new]

  def index
    @posts = Post.all.order(created_at: :desc).limit(20)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(get_safe_params(params))
    @post.user = current_user
      if @post.save
        redirect_to '/'
      else
        render 'new'
      end
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.where(commentable_id: @post.id, commentable_type: 'Post')
  end

  def edit
  end

  def update
  end

  def upvote
    @post = Post.find(params[:id])
    @post.votes += 1
    @post.save
    redirect_to :action => :index
  end

  def downvote
    @post = Post.find(params[:id])
    @post.votes -= 1
    @post.save
    redirect_to '/'
  end

  def add_new_comment
    @post = Post.find(params[:id])
    @user_who_commented = current_user
    @comment = Comment.build_from( @post, @user_who_commented.id, params[:body] )
    @comment.save!
    redirect_to :action => :show, :id => @post
  end

  private

  def get_safe_params(params)
    params.require(:post).permit(:id, :description, :link, :comment)
  end
end
