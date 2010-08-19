class PostsController < ApplicationController
  before_filter :authorize, :except => [:index, :show]
  
  def index
    # @post = Post.find(:all) 
    # @posts = Post.search(params[:search])
    @makes = Make.find(:all)
    if params[:location] && params[:car_id] && params[:car_make_id]
      if params[:radius]
        @posts = Post.search(params[:location], params[:car_id], params[:radius])
      else
        @posts = Post.search(params[:location], params[:car_id])
      end
      @car_searched_for = Car.find_by_id(params[:car_id])
      @make_searched_for = Make.find_by_id(params[:car_make_id])
      @cars_searched_by_make_id = Car.find_all_by_make_id(params[:car_make_id])
      
      @location_searched_for = params[:location]
    else
      @posts = Post.find(:all, :order => "created_at DESC")      
    end
      @lat, @lng = get_lat_lng(params[:location] || '3049 mississauga road, missisauga, on')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :layout => false }
      format.json  { render :layout => false }
    end
  end

  def new
    @makes = Make.find(:all)
    @post = Post.new
    @dealers = Dealer.find(:all)
  end
  
  def create
    @post = Post.new(params[:post])
    if @post.save
      flash[:notice] = 'Post created.'
      redirect_to :controller => 'posts', :action => 'show', :id => @post.id
    end
    
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
  
  # def authorize
  #   
  # end
end
