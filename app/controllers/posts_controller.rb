class PostsController < ApplicationController

  def index
    # @post = Post.find(:all) 
    # @posts = Post.search(params[:search])
    @posts = Post.search(params[:location], params[:car_id])
    @car_searched_for = Car.find_by_id(params[:car_id])
    @make_searched_for = Make.find_by_id(params[:car_make_id])

    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :layout => false }
    end
  end

  def new
    @post = Post.new
    @makes = Make.find(:all)
    # @cars = Car.find(:all)
  end

  def show
    @post = Post.find_by_id(params[:id])
    @car = Car.find_by_id(@post.car_id)
    @make = Make.find_by_id(@car.make_id)
    @dealer = Dealer.find_by_id(@post.dealer_id)
    @user = User.find_by_id(@post.user_id)
  end

  def update
  end

end
