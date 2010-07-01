class PostController < ApplicationController

  def index
    @post = Post.find(:all) 
  end

  def new
    @post = Post.new
  end

  def show
  end

  def update
  end

end
