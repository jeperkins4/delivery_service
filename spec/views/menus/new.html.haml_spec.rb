require 'rails_helper'

RSpec.describe "menus/new", :type => :view do
  before(:each) do
    assign(:menu, Menu.new(
      :location => nil,
      :name => "MyString",
      :description => "MyString",
      :category => "MyText",
      :price => ""
    ))
  end

  it "renders new menu form" do
    render

    assert_select "form[action=?][method=?]", menus_path, "post" do

      assert_select "input#menu_location_id[name=?]", "menu[location_id]"

      assert_select "input#menu_name[name=?]", "menu[name]"

      assert_select "input#menu_description[name=?]", "menu[description]"

      assert_select "textarea#menu_category[name=?]", "menu[category]"

      assert_select "input#menu_price[name=?]", "menu[price]"
    end
  end
end
