json.array!(@franchises) do |franchise|
  json.extract! franchise, :id, :name, :merchant_key
  json.url franchise_url(franchise, format: :json)
end
