class PostsController < ApplicationController
  
  def index
    # @post = Post.find(:all) 
    # @posts = Post.search(params[:search])
    @posts = Post.search(params[:location], params[:car_id])
    if params[:car_id] && params[:car_make_id]
      @car_searched_for = Car.find_by_id(params[:car_id])
      @make_searched_for = Make.find_by_id(params[:car_make_id])
    end
    
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
  
  def get_cars
    @results = Car.find_all_by_make_id(params[:make_id])
    render :partial => 'options'
  end
end
