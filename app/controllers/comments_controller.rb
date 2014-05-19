class CommentsController < ApplicationController

  before_action :authenticate_user, :postsfind
  before_action :set_comment, only: [:index, :new]


  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
      if @comment.save
        flash[:notice] = 'Comment was successfully created.'
        redirect_to post_path(@post)
      else
        render post_path(@comment.post_id)
  end
end

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
  def set_comment
      @comment = @post.comments.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:text_comment)
    end

  def postsfind
    @post = Post.find(params[:post_id])
  end

  

end

