class PostsController < ApplicationController

  def index
    # @post = Post.find(:all) 
    @posts = Post.search(params[:search])
  end

  def new
    @post = Post.new
  end

  def show
  end

  def update
  end

end
