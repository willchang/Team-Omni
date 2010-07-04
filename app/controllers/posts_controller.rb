class PostsController < ApplicationController

  def index
    # @post = Post.find(:all) 
    if params[:search]
      @posts = Post.find(:all, :conditions => ['car_id LIKE ?', "%#{params[:search]}"])
    else
      @posts = Post.find(:all)
    end
  end

  def new
    @post = Post.new
  end

  def show
  end

  def update
  end

end
