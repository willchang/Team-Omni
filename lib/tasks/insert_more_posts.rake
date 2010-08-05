
desc "insert posts near 12 ross st, radius of 2"
task :add_post => :environment do
  dealers = %w(1753 942 500 76 321 499 1815 669 641 502 501 1599 1744 1829).map{|x| x.to_i}
  cars = %w(1 2 12).map{|x| x.to_i}
  i = 1
  dealers.each do |dealer_id|
    Post.create( :user_id => i, :car_id => cars.at(3 - rand(4)), :dealer_id => dealer_id, :price_paid => 20000 + rand(65000), :description => "Great time #{rand(200)} with the sales people, they're cool ", :year => 2010)
    i += 1
    #makes sure that user id of < 6 is used
    i = 1 if i > 5
  end
end
    #mysql = Mysql::new('localhost','root','','omni_dev')
    #table = 'posts'
    #for i in (10..16) 
    #  row_data = [i,1,12,1753,20000 + rand(5000),"this car is awesome #{i}",2010]
    #  query = "insert into #{table} values(#{s.join(",")})"
    #  mysql.query(query)
    #end
