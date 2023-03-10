class PostsController < ApplicationController
  def index
    @user = User.find_by(params[:author_id])
    @posts = @user.posts.includes(:comments)
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.author_id = current_user.id
    @post.comments_counter = 0
    @post.likes_counter = 0

    if @post.save
      flash[:success] = 'Post saved successfully'
      redirect_to "/users/#{@post.author.id}/posts/#{@post.id}"
    else
      flash.now[:error] = 'Error: Post could not be created!!'
      render :new
    end
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
