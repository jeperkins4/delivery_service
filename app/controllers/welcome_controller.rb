class WelcomeController < ApplicationController
  include Geolocation

  def index
    @hash = MapLocations.new(Franchise.all).call
  end
end
