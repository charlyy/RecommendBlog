class CommentsController < ApplicationController

  before_action :authenticate_user

  def index
    @posts = Post.all
    @comments = Comment.all
  end

  def show
    @comment = comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    Comment.create(params.require(:comment).permit(:text_comment))
    redirect_to posts_path
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(params.require(:comment).permit(:text_comment))
      redirect_to comments_path
    else
      render 'edit'
    end
  end

  def destroy
  end
end
end

end
