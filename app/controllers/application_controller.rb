# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  layout 'main'
  before_filter :authorize, :except => [:login, :signup]
  before_filter :check_login
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  def check_login
    if session[:user_id]
      @username = User.find_by_id(session[:user_id]).username  
    end    
  end

  protected

  def authorize
    unless User.find_by_id(session[:user_id])
      session[:original_uri] = request.request_uri
      flash[:notice] = "Please login."
      redirect_to :controller => 'admin', :action => 'login'
    end
  end

end
