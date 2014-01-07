require 'spec_helper'

describe "articles/show" do
  before(:each) do
    @article = assign(:article, stub_model(Article,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Blurb/)
    rendered.should match(/MyText/)
    rendered.should match(/1/)
    rendered.should match(/Type/)
    rendered.should match(/2/)
    rendered.should match(/MyText/)
    rendered.should match(/3/)
    rendered.should match(/Byline/)
    rendered.should match(/4/)
  end
end
