class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  belongs_to :dealer
  
  def self.search(search)
      if search
      find(:all, :conditions => ['car_id LIKE ?', "%#{search}"])
    else
      find(:all)
    end
  end
end
