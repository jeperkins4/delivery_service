require 'rails_helper'

RSpec.describe "locations/index", :type => :view do
  before(:each) do
    assign(:locations, [
      Location.create!(
        :name => "Name",
        :description => "Description",
        :street => "Street",
        :city => "City",
        :state => "State",
        :country => "Country",
        :postal_code => "Postal Code",
        :latitude => "9.99",
        :longitude => "9.99"
      ),
      Location.create!(
        :name => "Name",
        :description => "Description",
        :street => "Street",
        :city => "City",
        :state => "State",
        :country => "Country",
        :postal_code => "Postal Code",
        :latitude => "9.99",
        :longitude => "9.99"
      )
    ])
  end

  it "renders a list of locations" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Street".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => "Postal Code".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
