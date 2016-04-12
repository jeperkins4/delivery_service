json.array!(@menus) do |menu|
  json.extract! menu, :id, :place_id, :name, :description, :category, :hours
  json.url menu_url(menu, format: :json)
end
