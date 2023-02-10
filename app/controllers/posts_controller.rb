class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show; end
  @post = Post.find(params[:id])
end
