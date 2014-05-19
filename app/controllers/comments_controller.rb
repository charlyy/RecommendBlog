class CommentsController < ApplicationController

  before_action :authenticate_user
  before_action :postsfind, only: [:index, :create, :new]

  def new
    @comment = Comment.new
  end


  def show
    @comment = Comment.find(params[:id])
  end


  def create
    @comment = current_user.Comment.new(params.require(:comment).permit(:text_comment))
    @comment.post = @post
    @comment.user = current_user
      if @comment.save
        redirect_to comment_path(@post)
      else
        render post_path(@comment.post_id)
  end
end
  # def edit
  #   @comment = Comment.find(params[:id])
  #   if (@post.user == current_user)
  #     @comment.
  # end

  # def update
  #   @comment = Comment.find(params[:id])
  #   if @comment.update(params.require(:comment).permit(:text_comment))
  #     redirect_to comments_path
  #   else
  #     render 'edit'
  #   end
  # end

  def destroy
      @comment = Comment.find(params[:id])
      if (@post.user == current_user)
        @comment.destroy
        redirect_to post_path(@comment.post_id)
      else
        redirect_to post_path(@comment.post_id)
  end
end


private
  def postsfind
    @post = Post.find(params[:post_id])
  
end

end

