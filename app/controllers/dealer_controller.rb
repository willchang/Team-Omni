class DealerController < ApplicationController
  def index
    @dealer = Dealer.find(:all)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @dealer }
    end
  end

  def show
    @dealer = Dealer.find(params[:id])
  
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @dealer }
    end
  end


  protected

  def authorize
    
  end
end
