class PostsController < ApplicationController
  # index route
  def index
    render json: Post.all
  end

  # show route
  def show
    render json: Post.find(params["id"])
  end

end
