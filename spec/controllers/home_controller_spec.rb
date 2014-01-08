require 'spec_helper'

describe HomeController do
  before do
    @article = FactoryGirl.create(:feature)
    @cover = FactoryGirl.create(:cover)
  end

  describe "GET 'index'" do
    before { get :index }
    it "returns http success" do
      response.should be_success
    end
    it 'includes my article' do
      assigns('articles').should include @article
    end
    it 'includes my cover story' do
      assigns('covers').should include @cover
    end
  end
end
