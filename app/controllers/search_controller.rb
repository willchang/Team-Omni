class SearchController < ApplicationController
  def index
    @makes = Make.find(:all)
    @cars = Car.find(:all)
  end

  def find
  end
  
  # def car_list
  # end
  
  #  gets the list of cars for dropdown menu
  def get_cars
    @results = Car.find_all_by_make_id(params[:make_id])
    render :partial => 'options'
  end
  
  protected

  def authorize
    
  end
end
