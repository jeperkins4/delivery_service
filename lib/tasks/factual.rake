require 'factual'

namespace :factual do

  desc 'Load Factual Data'
  task :load, [:location] => :environment do |t, args|
    args.with_defaults(location: 'Tallahassee, FL')
    location = args[:location]
    franchise = Franchise.find_by(location: location)
    ignore_list = ['Social','Restaurants','Food and Dining']
    factual = Factual.new(APP[:factual][:key], APP[:factual][:secret])
    rows = factual.table("places-us").search(location).filters("category_ids" => {"$includes" => 347}).rows
    rows.each do |row|
      place = Place.find_or_create_by(name: row['name'],
                                      street: row['address'],
                                      city: row['locality'],
                                      factual_key: row['factual_id'])
      place.franchise_id = franchise.try(:id)
      place.state = row['region']
      place.postal_code = row['postcode']
      place.latitude = row['latitude']
      place.longitude = row['longitude']
      place.hours = row['hours']
      place.category = row['category_labels'].flatten.uniq - ignore_list
      place.phone = row['tel']
      place.email = row['email']
      place.website = row['website']
      place.neighborhood = row['neighborhood'].join(', ') unless row['neighborhood'].nil?
      place.save
    end
  end
end
