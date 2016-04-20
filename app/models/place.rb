class Place < ApplicationRecord
  include Hours
  belongs_to :franchise
  has_many :menus

  serialize :category, Array
  serialize :hours, JSON

  scope :archived, -> { where(:is_archived => true) }

  def self.available
    day_of_week = Date.today.strftime('%A').downcase
    where.not(hours: nil).select do |place|
      place.hours.key?(day_of_week) && place.within_time?
    end
  end

  def address
    [self.street, [[self.city, self.state].join(', '), self.postal_code].join(' ')].join(', ')
  end

  def distance_in_time(origin)
    return if origin.nil?
    prep_time = actual_prep_time.to_i || estimated_prep_time.to_i
    "#{directions(origin).drive_time_in_minutes + prep_time} minutes"
  end

  def distance(origin)
    return if origin.nil?
    "#{directions(origin).distance_in_miles} miles"
  end

  after_save :refresh_prep_time

  private

  def directions(origin)
    return if origin.nil?
    Rails.cache.fetch("driving_directions_#{origin.gsub(',','').gsub(' ','_')}:#{address.gsub(',','').gsub(' ','_')}", expires_in: 1.hour) do
      GoogleDirections.new(origin, address)
    end
  end

  def refresh_prep_time
    RefreshPlaceServingTimeJob.perform_later self
  end
end
