class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  belongs_to :dealer
  belongs_to :car
  
  def self.search(location, car_id)
    #   if search
    #   find(:all, :conditions => ['car_id LIKE ?', "%#{search}"])
    # else
    #   find(:all)
    if location
      if car_id
        find(:all, :conditions => ['car_id LIKE ?', "%#{car_id}"])
      end
    end
    # if location && car_id
    #   find(:all, :conditions => ['car_id LIKE ?', "%#{car_id}"])
    # else
    #   find(:all)
    # end
  end
end
