require 'spec_helper'

describe HomeController do
  before do
    @article = FactoryGirl.create(:feature)
  end

  describe "GET 'index'" do
    before { get :index }
    it "returns http success" do
      response.should be_success
    end
    it 'includes my article' do
      assigns('articles').should include @article
    end
  end
end
