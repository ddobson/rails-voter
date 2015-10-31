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
  end

  def edit
  end

  def update
  end

  def upvote
    @post = Post.find(params[:id])
    @post.votes += 1
    @post.save
    redirect_to '/'
  end

  def downvote
    @post = Post.find(params[:id])
    @post.votes -= 1
    @post.save
    redirect_to '/'
  end

  private

  def get_safe_params(params)
    params.require(:post).permit(:description, :link)
  end
end
