class PostsController < ApplicationController

  before_action :authenticate_user

  def index
    @posts = Post.all
    @comments = Comment.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(params.require(:post).permit(:headline, :body_content => [], :picture))
    redirect_to burritos_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(params.require(:post).permit(:headline, :body_content => [], :picture))
      redirect_to burritos_path
    else
      render 'edit'
    end
  end

  def destroy
  end
end
end
