require 'spec_helper'

describe Menu do
  let(:menu) { Fabricate(:menu) }

  context 'delegation' do
    it "should delegate association" do
      menu.place_name.should be 
    end
  end
end
