require 'spec_helper'

describe Driver do
  let(:driver) { Fabricate(:driver) }

  context 'delegation' do
    it "should delegate association" do
      driver.user_name.should be 
    end
  end
end
