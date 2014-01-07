require 'spec_helper'

describe "articles/index" do
  before(:each) do
    assign(:articles, [
      stub_model(Article,
        :title => "Title",
        :blurb => "Blurb",
        :text => "MyText",
        :settings => 1,
        :type => "Type",
        :review_score => 2,
        :sidebar => "MyText",
        :original_id => 3,
        :byline => "Byline",
        :comment_count => 4
      ),
      stub_model(Article,
        :title => "Title",
        :blurb => "Blurb",
        :text => "MyText",
        :settings => 1,
        :type => "Type",
        :review_score => 2,
        :sidebar => "MyText",
        :original_id => 3,
        :byline => "Byline",
        :comment_count => 4
      )
    ])
  end

  it "renders a list of articles" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Blurb".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Byline".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
