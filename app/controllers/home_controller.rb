class HomeController < ApplicationController
  layout false, except: [:index]
  respond_to :html

  def index
    @articles = Rails.cache.fetch 'index-articles' do
      Article.published.paginates(0).load
    end

    @articles ||= []

    @covers = Rails.cache.fetch 'index-covers' do
      covers = Cover.limit(3).joins("LEFT JOIN `articles` ON `articles`.`id` = `covers`.`article_id`").order('weight ASC').load
      covers
    end

    @stylesheets = ['home']
    @javascripts = []
  end
end
