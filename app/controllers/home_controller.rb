class HomeController < ApplicationController
  layout false, except: [:index]
  respond_to :html

  def index
    @articles = Rails.cache.fetch 'index-articles' do
      Article.published.paginates(0).load
    end

    @articles ||= []

    @covers = Rails.cache.fetch 'index-covers' do
      covers = Cover.front_page
    end

    @covers ||= []

    @stylesheets = ['home']
  end
end
