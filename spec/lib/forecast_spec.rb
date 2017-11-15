require 'spec_helper'
require 'google'

describe Google::Mapping do
  let!(:address) { '1801 California Street, Denver, CO' }

  context "locations" do
    it "should geocode an address" do
      Google::Mapping.geocode(address).should_not be_nil
    end

    it "should return lat, lng for an address" do
      Google::Mapping.find_lat_lng(address).map{|l|l.round(4)}.should == [39.7477, -104.9898]
    end

    it "should return the zip code" do
      Google::Mapping.find_zip(address).should == '80202'
    end
  end
end
