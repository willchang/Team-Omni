class AdminController < ApplicationController
  def index
    # This is a comment not in WIll's
  end

  def login
    if request.post? 
      user = User.authenticate(params[:username], params[:password])
      if user
        session[:user_id] = user.id
        uri = session[:original_uri]
        session[:original_uri] = nil
        redirect_to(uri || {:action => 'index'})
      else
        flash.now[:notice] = "Invalid username or password."
      end
    end
  end
  
  def signup
    if request.post?
      @user = User.new(params[:user])
      if @user.save
        flash[:notice] = 'User was successfully created.'
        redirect_to :controller => 'admin', :action => 'login'
      end
    else #just a reqular get request
      @user = User.new
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to(:action => "login" )
  end

    
end
