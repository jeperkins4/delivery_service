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

end
