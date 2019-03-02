class PostsController < ApplicationController
  # index route
  def index
    render json: Post.all
  end
  
end
