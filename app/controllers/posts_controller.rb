class PostsController < ApplicationController

  def index
    # @post = Post.find(:all) 
    # @posts = Post.search(params[:search])
    @posts = Post.search(params[:location], params[:car_id])
    @car_searched_for = Car.find_by_id(params[:car_id])
    @make_searched_for = Make.find_by_id(params[:car_make_id])
  end

  def new
    @post = Post.new
  end

  def show
  end

  def update
  end
  
  def view
    
  end

end
