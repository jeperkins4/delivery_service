module Hours
  extend ActiveSupport::Concern

  included do
  end

  def within_time?
    day_of_week = Date.today.strftime('%A').downcase
    self.hours[day_of_week].select do |availability|
      range = Chronic.parse(availability.first)..Chronic.parse(availability.last)
      range === Time.now.to_i
    end
  end
end
