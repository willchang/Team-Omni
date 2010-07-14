#problems - num_array = %w(97 109 145  347  528  633  642  663  830  894  933 1040 1172 1181 1296 1396 1447 1457 1517 1555 1623 1708 1760 1808 1869 1925 1985 2101 2228 2580)
task :geo1 => :environment do
  geolocate(1,10) 
end 

task :geo2 => :environment do
  geolocate(11,96)
end
task :geo3 => :environment do
  geolocate(146,300)
end

task :geo4 => :environment do
  geolocate(1986,2000)
end

task :geo5 => :environment do
  geolocate(2581,2658)
end

def geolocate(limit_first,limit_last)
  d = Dealer.find(:all, :conditions => ['id >= ? and id <= ?', limit_first, limit_last])
  d.each do |d|
    d.lat, d.lng = Dealer.get_lat_lng(d.address,d.city,d.province)
    if d.save
      #do nothing
    else
      puts " Was not able to get the long and lat coordinates of Dealer #{d.id}"
    end
  end
end
