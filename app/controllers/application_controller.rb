class ApplicationController < ActionController::Base
  def current_post
    User.first.posts.first
  end
end
