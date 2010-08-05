class CarsController < ApplicationController
  # before_filter :authorize, :except => [:for_makeid]
  def for_makeid
    # @cars = Car.find( :all, :conditions => [" make_id = ?", params[:id]]  ).sort_by{ |k| k['name'] }
    @cars = Car.find_all_by_make_id(params[:id])
    respond_to do |format|
      format.json  { render :json => @cars }
    end
  end

  def show
    if params[:id].class == Fixnum
      @car = Car.find(params[:id])
    elsif params[:id].class == String
      @car = Car.find_by_name(params[:id])
    else
      flash[:notice] = "something wrong with your car parameter"
    end
  
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @car }
    end
  end
  
  def authorize
    
  end
end
