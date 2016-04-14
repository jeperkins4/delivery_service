class MapLocations
  attr_accessor :franchises

  def initialize(franchises)
    self.franchises = franchises
  end

  def call
    points = franchises.map do |franchise|
      Gmaps4rails.build_markers(franchise) do |spot, marker|
        marker.lat franchise.latitude
        marker.lng franchise.longitude
        marker.infowindow franchise.name
      end
    end.flatten
  end
end
