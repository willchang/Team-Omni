require 'rubygems'
require 'geokit'
class Dealer < ActiveRecord::Base
  has_many :posts
  #acts_as_mappable

  def self.get_lat_lng(address, city, province)
    #geo = Geokit::Geocoders::YahooGeocoder.geocode("#{address}, #{city}, #{province}")
    geo = Geokit::Geocoders::GoogleGeocoder.geocode("#{address}, #{city}, #{province}")
    return geo.lat,geo.lng
  end

  def self.find_nearby_dealers  
    self.find_by_sql('SELECT id, ( 3959 * acos( cos( radians(37) ) * cos( radians( lat ) ) * cos( radians( lng ) - radians(-122) ) + sin( radians(37) ) * sin( radians( lat ) ) ) ) AS distance FROM dealers HAVING distance < 25 ORDER BY distance LIMIT 0 , 20;')
    
  end
end

