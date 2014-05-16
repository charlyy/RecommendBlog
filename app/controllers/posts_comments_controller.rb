class PostsCommentsController < ApplicationController
class ArtistsSongsController < ApplicationController

  # GET /songs/new
  # GET /songs/new.json
  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
    # @albums = Album.where(:artist_id => params[:artist_id])
  end

  # POST /songs
  # POST /songs.json
  def create
    @comment = Comment.new(comment_params)
    @comment.post_id = params[:post_id]

    if @comment.save
      flash[:success] = "New Comment Created!"
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def comment_params
    params.require(:comment).permit(:text_comment)
  end

end



end
