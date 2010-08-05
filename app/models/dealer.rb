require 'rubygems'
require 'geokit'
class Dealer < ActiveRecord::Base
  has_many :posts
  acts_as_mappable

  def self.get_lat_lng(location)
    #geo = Geokit::Geocoders::YahooGeocoder.geocode("#{address}, #{city}, #{province}")
    geo = Geokit::Geocoders::GoogleGeocoder.geocode(location)
    return geo.lat,geo.lng
  end

  def self.find_nearby_dealers(myLat, myLng, radius)
    find_by_sql("SELECT *, ( 3959 * acos( cos( radians(#{myLat}) ) * cos( radians( dealers.lat ) ) * cos( radians( dealers.lng ) - radians(#{myLng}) ) + sin( radians(#{myLat}) ) * sin( radians( dealers.lat ) ) ) ) AS distance FROM dealers HAVING distance < #{radius} ORDER BY distance;")
  end


end

