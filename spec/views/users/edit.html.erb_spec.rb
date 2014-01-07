require 'spec_helper'

describe "users/edit" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :name => "MyString",
      :email => "MyString",
      :password => "",
      :active => false,
      :blurb => "MyText",
      :title => "MyString"
    ))
  end

  it "renders the edit user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", user_path(@user), "post" do
      assert_select "input#user_name[name=?]", "user[name]"
      assert_select "input#user_email[name=?]", "user[email]"
      assert_select "input#user_password[name=?]", "user[password]"
      assert_select "input#user_active[name=?]", "user[active]"
      assert_select "textarea#user_blurb[name=?]", "user[blurb]"
      assert_select "input#user_title[name=?]", "user[title]"
    end
  end
end
