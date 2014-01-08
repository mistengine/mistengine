require 'spec_helper'

describe "covers/index" do
  before(:each) do
    assign(:covers, [
      stub_model(Cover,
        :article_id => 1,
        :title => "Title",
        :url => "Url",
        :description => "MyText",
        :active => false,
        :weight => 2
      ),
      stub_model(Cover,
        :article_id => 1,
        :title => "Title",
        :url => "Url",
        :description => "MyText",
        :active => false,
        :weight => 2
      )
    ])
  end

  it "renders a list of covers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
