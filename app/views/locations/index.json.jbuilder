json.array!(@locations) do |location|
  json.extract! location, :id, :name, :description, :street, :city, :state, :country, :postal_code, :latitude, :longitude
  json.url location_url(location, format: :json)
end
