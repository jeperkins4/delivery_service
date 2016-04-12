require 'spec_helper'

describe Order do
  let(:order) { Fabricate(:order) }

  context 'delegation' do
    it "should delegate association" do
      order.user_name.should be 
    end
    it "should delegate association" do
      order.place_name.should be 
    end
    it "should delegate association" do
      order.driver_name.should be 
    end
  end
end
