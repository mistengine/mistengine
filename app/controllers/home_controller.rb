class HomeController < ApplicationController
  def index
    @articles = Rails.cache.fetch 'index-articles' do
      Article.paginates(0).load
    end

    fresh_when last_modified: @articles.first.updated_at.utc, etag: @articles.first
  end
end
