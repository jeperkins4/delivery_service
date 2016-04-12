require 'rails_helper'

RSpec.describe "locations/show", :type => :view do
  before(:each) do
    @location = assign(:location, Location.create!(
      :name => "Name",
      :description => "Description",
      :street => "Street",
      :city => "City",
      :state => "State",
      :country => "Country",
      :postal_code => "Postal Code",
      :latitude => "9.99",
      :longitude => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Street/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Country/)
    expect(rendered).to match(/Postal Code/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
  end
end
