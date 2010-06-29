class PostController < ApplicationController

  def index
    @posts = Post.find(:all) 
  end

  def new
  end

  def show
  end

  def update
  end

end
