json.array!(@drivers) do |driver|
  json.extract! driver, :id, :user_id, :license, :state
  json.url driver_url(driver, format: :json)
end
