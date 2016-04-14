namespace :google_places do

  desc 'Load Google Places Data'
  task :load, [:location] => :environment do |t, args|
    args.with_defaults(location: 'Tallahassee, FL')
    location = args[:location]
    franchise = Franchise.find_by(location: location)
    return if franchise.nil?
    ignore_list = ['Social','Restaurants','Food and Dining', 'food', 'restaurant', 'point_of_interest']
    client = GooglePlaces::Client.new(APP[:google][:maps][:api_key])
    rows = client.spots(franchise.latitude.to_f, franchise.longitude.to_f, types: 'restaurant')
    rows.each do |row|
      place = Place.find_or_create_by(name: row.name,
                                      street: row.vicinity,
                                      city: row.city,
                                      franchise_id: franchise.id)
      place.latitude = row.lat
      place.longitude = row.lng
      place.postal_code = row.postal_code
      place.category = row.types.flatten.uniq - ignore_list
      place.save
    end
  end
end
