class PostsController < ApplicationController

  before_action :authenticate_user

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @posts = Post.all
    @comment = @post.comments.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:headline, :blog_content, :picture))
    @post.user = current_user
    if @post.save
      flash[:notice] = 'Post was successfully created.'
      redirect_to posts_path
    else
      render 'new'
  end
end


  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(params.require(:post).permit(:headline, :blog_content, :picture))
      flash[:notice] = 'Post was successfully updated.'
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if (@post.user == current_user)
      @post.destroy
      redirect_to posts_path
    else
      redirect_to posts_path
  end
end
end
