class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  belongs_to :dealer
  belongs_to :car
  
  def self.search(location, car_id)
    if location
      if car_id
        find(:all, :conditions => {:car_id => car_id})
      end
    end
  end
  
  def dealer_name
    dealer.name if dealer    
  end
  
  def dealer_name=(name)
    self.dealer = Dealer.find_by_name(name) unless name.blank?
    
  end
end
