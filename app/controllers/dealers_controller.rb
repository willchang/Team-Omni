class DealersController < ApplicationController
  def index
    @dealers = Dealer.find(:all, :conditions => ['name LIKE ?', "%#{params[:q]}"])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @dealers }
      format.json { render :json => @dealers.to_json(:only => [:id, :name]) }
    end
  end

  def show
    @dealer = Dealer.find(params[:id])
  
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @dealer }
    end
  end

  def temp
    #do nothing
    if params[:temp_name]
      flash[:notice] = "Yey"
      @temp = "It worked. Params can be accessed"
    end
  end
  protected

  def authorize
    
  end
end
