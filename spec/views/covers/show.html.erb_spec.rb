require 'spec_helper'

describe "covers/show" do
  before(:each) do
    @cover = assign(:cover, stub_model(Cover,
      :article_id => 1,
      :title => "Title",
      :url => "Url",
      :description => "MyText",
      :active => false,
      :weight => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Title/)
    rendered.should match(/Url/)
    rendered.should match(/MyText/)
    rendered.should match(/false/)
    rendered.should match(/2/)
  end
end
