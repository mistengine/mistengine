require 'spec_helper'

describe "articles/edit" do
  before(:each) do
    @article = assign(:article, stub_model(Article,
      :title => "MyString",
      :blurb => "MyString",
      :text => "MyText",
      :settings => 1,
      :type => "",
      :review_score => 1,
      :sidebar => "MyText",
      :original_id => 1,
      :byline => "MyString",
      :comment_count => 1
    ))
  end

  it "renders the edit article form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", article_path(@article), "post" do
      assert_select "input#article_title[name=?]", "article[title]"
      assert_select "input#article_blurb[name=?]", "article[blurb]"
      assert_select "textarea#article_text[name=?]", "article[text]"
      assert_select "input#article_settings[name=?]", "article[settings]"
      assert_select "input#article_type[name=?]", "article[type]"
      assert_select "input#article_review_score[name=?]", "article[review_score]"
      assert_select "textarea#article_sidebar[name=?]", "article[sidebar]"
      assert_select "input#article_original_id[name=?]", "article[original_id]"
      assert_select "input#article_byline[name=?]", "article[byline]"
      assert_select "input#article_comment_count[name=?]", "article[comment_count]"
    end
  end
end
