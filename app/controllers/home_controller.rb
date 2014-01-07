class HomeController < ApplicationController
  def index
    @articles = Rails.cache.fetch 'index-articles' do
      Article.paginates(0).load
    end

    last_modified, etag_obj = get_last_modified([@articles.first])

    fresh_when last_modified: last_modified, etag: etag_obj
    expires_in 1.hour, public: true
  end
end
