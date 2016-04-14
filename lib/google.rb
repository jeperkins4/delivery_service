require 'builder'
require 'cgi'
require 'open-uri'

module Google
  class Mapping
    def self.geocode(address)
      unless address.blank?
        url_string = 'http://maps.googleapis.com/maps/api/geocode/json'
        params = {}
        params['address'] = Rack::Utils.escape(address)
        params['sensor'] = 'false'

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

    def self.find_zip(address)
      postal_code = ''
      results = self.geocode(address)
      results['results'][0]['address_components'].each do |comp|
        if comp['types'].include? 'postal_code'
          postal_code = comp['long_name']
        end
      end
      return postal_code
    end
  end
end
