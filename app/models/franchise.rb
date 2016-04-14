class Franchise < ApplicationRecord
  include Google
  has_many :users
  has_many :places

  geocoded_by :location

  before_save :setup

  def setup
    geocode if self.latitude.nil? or self.longitude.nil?
  rescue => e
    puts "#{e.message} Unable to geocode"
  end
end
