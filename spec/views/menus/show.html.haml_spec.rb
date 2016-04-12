require 'rails_helper'

RSpec.describe "menus/show", :type => :view do
  before(:each) do
    @menu = assign(:menu, Menu.create!(
      :location => nil,
      :name => "Name",
      :description => "Description",
      :category => "MyText",
      :price => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
