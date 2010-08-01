class CarsController < ApplicationController
  def for_makeid
    @cars = Car.find( :all, :conditions => [" make_id = ?", params[:id]]  ).sort_by{ |k| k['name'] }
    respond_to do |format|
      format.json  { render :json => @cars }
    end
  end
  
  def authorize
    
  end
end