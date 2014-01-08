require 'spec_helper'

describe "users/new" do
  before(:each) do
    assign(:user, stub_model(User,
      :name => "MyString",
      :email => "MyString",
      :password => "",
      :active => false,
      :blurb => "MyText",
      :title => "MyString"
    ).as_new_record)
  end

  it "renders new user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", users_path, "post" do
      assert_select "input#user_name[name=?]", "user[name]"
      assert_select "input#user_email[name=?]", "user[email]"
      assert_select "input#user_password[name=?]", "user[password]"
      assert_select "input#user_active[name=?]", "user[active]"
      assert_select "textarea#user_blurb[name=?]", "user[blurb]"
      assert_select "input#user_title[name=?]", "user[title]"
    end
  end
end