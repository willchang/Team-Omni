class DealerController < ApplicationController
  def index
    @dealer = Dealer.find(:all)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @dealer }
      format.json  { render :json => @dealer.to_json(:only => [:id, :name]) }
    end
  end

  def show
    @dealer = Dealer.find(params[:id])
  
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @dealer }
    end
  end

  def map
    @dealer = Dealer.find(:first)
  end

  protected

  def authorize
    
  end
end
