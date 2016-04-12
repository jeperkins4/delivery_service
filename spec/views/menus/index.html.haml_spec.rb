require 'rails_helper'

RSpec.describe "menus/index", :type => :view do
  before(:each) do
    assign(:menus, [
      Menu.create!(
        :location => nil,
        :name => "Name",
        :description => "Description",
        :category => "MyText",
        :price => ""
      ),
      Menu.create!(
        :location => nil,
        :name => "Name",
        :description => "Description",
        :category => "MyText",
        :price => ""
      )
    ])
  end

  it "renders a list of menus" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
