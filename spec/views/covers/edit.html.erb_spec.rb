require 'spec_helper'

describe "covers/edit" do
  before(:each) do
    @cover = assign(:cover, stub_model(Cover,
      :article_id => 1,
      :title => "MyString",
      :url => "MyString",
      :description => "MyText",
      :active => false,
      :weight => 1
    ))
  end

  it "renders the edit cover form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", cover_path(@cover), "post" do
      assert_select "input#cover_article_id[name=?]", "cover[article_id]"
      assert_select "input#cover_title[name=?]", "cover[title]"
      assert_select "input#cover_url[name=?]", "cover[url]"
      assert_select "textarea#cover_description[name=?]", "cover[description]"
      assert_select "input#cover_active[name=?]", "cover[active]"
      assert_select "input#cover_weight[name=?]", "cover[weight]"
    end
  end
end
