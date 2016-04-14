module Geolocation
  extend ActiveSupport::Concern

  included do
    after_action :set_markers, only: [:demographic_certification, :geographic_certification]

    def set_markers
      @locations = LocationInfo.active.where.not(latitude: nil)
      @hash = markers(@locations)
    end
  end
end
