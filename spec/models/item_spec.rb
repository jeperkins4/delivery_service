require 'spec_helper'

describe Item do
  let(:item) { Fabricate(:item) }

  context 'delegation' do
    it "should delegate association" do
      item.menu_name.should be 
    end
  end
end
