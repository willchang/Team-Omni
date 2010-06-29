class AdminController < ApplicationController
  def index
    @sed = session[:original_uri]
  end

  def login
    if request.post? 
      user = User.authenticate(params[:username], params[:password])
      if user
        session[:user_id] = user.id
        uri = session[:original_uri]
        flash[:notice] = "orig url is #{uri}"
        session[:original_uri] = nil
        redirect_to(uri || {:action => 'index'})
      else
        flash.now[:notice] = "invalid user/pass combo"
      end
    end
    @sed = session[:original_uri]
  end
  
  def signup
    if request.post?
      @user = User.new(params[:user])
      begin @user.save
        flash[:notice] = 'User was successfully created.'
      rescue Exception => e
        logger.error(e.message)
        flash[:notice] = e.message
      end
      redirect_to :controller => 'admin', :action => 'login'
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
