# The HomeController handles the data seen on the front page front page data.
class HomeController < ApplicationController
  respond_to :html

  def index
    @articles = Rails.cache.fetch 'index-articles' do
      Article.by_published.paginates(0).load
    end

    @articles ||= []

    @covers = Rails.cache.fetch 'index-covers' do
      Cover.front_page
    end

    @covers ||= []

    @stylesheets = ['home']
  end
end
