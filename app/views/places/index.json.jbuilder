json.array!(@places) do |place|
  json.extract! place, :id, :name, :description, :street, :city, :state, :country, :postal_code, :latitude, :longitude, :hours, :phone, :email, :website, :factual_key, :category, :neighborhood
  json.url place_url(place, format: :json)
end
