class PostsController < ApplicationController
  def index
    @user = User.find_by(params[:author_id])
    @posts = @user.posts.includes(:comments)
  end

  def show
    @post = Post.find_by(id: params[:id])
  end
end
