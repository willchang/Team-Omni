class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  belongs_to :dealer
  belongs_to :car
  
  validates_presence_of :year
  
  def self.search(location, car_id, radius=50)
    result = Geokit::Geocoders::GoogleGeocoder.geocode(location)
    myLat = result.lat
    myLng = result.lng
    if location
      if car_id

      find_by_sql("SELECT *, ( 3959 * acos( cos( radians(#{myLat}) ) * cos( radians( dealers.lat ) ) * cos( radians( dealers.lng ) - radians(#{myLng}) ) + sin( radians(#{myLat}) ) * sin( radians( dealers.lat ) ) ) ) AS distance FROM posts join dealers on dealers.id = posts.dealer_id WHERE posts.car_id = #{car_id} HAVING distance < #{radius} ORDER BY distance,created_at DESC;")
      end
    end
  end
  
end
