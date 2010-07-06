class Car < ActiveRecord::Base
  belongs_to :make
  has_many :posts

end
