# builds the xml file of filtered post results

xml.markers do
  for p in @posts
    xml.marker :name => p.dealer.name,
                :address => p.dealer.address,
                :lat => 25,
                :lng => 14
  end
end
