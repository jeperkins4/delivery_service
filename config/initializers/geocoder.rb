require 'geocoder/results/google'

Geocoder::Result::Google.class_eval do
  def county
    if county = address_components_of_type(:administrative_area_level_2).first
      county['long_name']
    end
  end
end

Geocoder::Configuration.lookup = :google #:geocoder_ca
Geocoder::Configuration.timeout = 20
Geocoder::Configuration.language = :en
