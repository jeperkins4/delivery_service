json.array!(@orders) do |order|
  json.extract! order, :id, :user_id, :place_id, :status, :placed_at, :pickup_at, :delivered_at, :rating, :street, :city, :state, :postal_code, :phone, :driver_id
  json.url order_url(order, format: :json)
end
