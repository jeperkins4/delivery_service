require 'builder'
require 'cgi'
require 'open-uri'

module Forecast
  class Mapping
    def self.get(origin)
      unless origin.empty?
        lat = origin[:latitude]
        lng = origin[:longitude]
        url_string = "https://api.forecast.io/#{APP[:forecastio][:key]}/#{lat},#{lng}"
        params = {}
        params['time'] = nil

        url_string = "#{url_string}?#{params.to_param}"
        puts "Searching for JSON #{url_string}"
        JSON.parse(open(url_string).read)
      end
    end

    def self.find_lat_lng(address)
      results = self.geocode(address)
      lat = results['results'][0]['geometry']['location']['lat']
      lng = results['results'][0]['geometry']['location']['lng']
      return lat, lng
    end
  end
end
