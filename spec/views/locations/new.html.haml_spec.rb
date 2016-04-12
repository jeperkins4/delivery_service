require 'rails_helper'

RSpec.describe "locations/new", :type => :view do
  before(:each) do
    assign(:location, Location.new(
      :name => "MyString",
      :description => "MyString",
      :street => "MyString",
      :city => "MyString",
      :state => "MyString",
      :country => "MyString",
      :postal_code => "MyString",
      :latitude => "9.99",
      :longitude => "9.99"
    ))
  end

  it "renders new location form" do
    render

    assert_select "form[action=?][method=?]", locations_path, "post" do

      assert_select "input#location_name[name=?]", "location[name]"

      assert_select "input#location_description[name=?]", "location[description]"

      assert_select "input#location_street[name=?]", "location[street]"

      assert_select "input#location_city[name=?]", "location[city]"

      assert_select "input#location_state[name=?]", "location[state]"

      assert_select "input#location_country[name=?]", "location[country]"

      assert_select "input#location_postal_code[name=?]", "location[postal_code]"

      assert_select "input#location_latitude[name=?]", "location[latitude]"

      assert_select "input#location_longitude[name=?]", "location[longitude]"
    end
  end
end
