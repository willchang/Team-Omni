require 'rubygems'
require 'geokit'
require 'vendor/plugins/geokit-rails/init.rb'
class Dealer < ActiveRecord::Base
  has_many :posts
  acts_as_mappable

  def self.get_lat_lng(address, city, province)
    #geo = Geokit::Geocoders::YahooGeocoder.geocode("#{address}, #{city}, #{province}")
    geo = Geokit::Geocoders::GoogleGeocoder.geocode("#{address}, #{city}, #{province}")
    return geo.lat,geo.lng
  end

  def self.find_nearby_dealers(myLat,myLng)
    self.find_by_sql("SELECT id, ( 3959 * acos( cos( radians(#{myLat}) ) * cos( radians( lat ) ) * cos( radians( lng ) - radians(#{myLng}) ) + sin( radians(#{myLat}) ) * sin( radians( lat ) ) ) ) AS distance FROM dealers HAVING distance < 25 ORDER BY distance LIMIT 0 , 20;")
    
  end
end

