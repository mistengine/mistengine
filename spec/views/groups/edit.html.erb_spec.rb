require 'spec_helper'

describe "groups/edit" do
  before(:each) do
    @group = assign(:group, stub_model(Group,
      :title => "MyString",
      :description => "MyText",
      :permissions => "MyText",
      :active => false
    ))
  end

  it "renders the edit group form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", group_path(@group), "post" do
      assert_select "input#group_title[name=?]", "group[title]"
      assert_select "textarea#group_description[name=?]", "group[description]"
      assert_select "textarea#group_permissions[name=?]", "group[permissions]"
      assert_select "input#group_active[name=?]", "group[active]"
    end
  end
end
