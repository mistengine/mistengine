class HomeController < ApplicationController
  def index
    @articles = Rails.cache.fetch 'index-articles' do
      Article.paginates(0).load
    end

    @articles ||= []

    @covers = Rails.cache.fetch 'index-covers' do
      covers = Cover.limit(3).joins(:article).order('weight ASC').load
      covers
    end

    last_modified, etag_obj = get_last_modified([@articles[0], @covers[0]])

    fresh_when last_modified: last_modified, etag: etag_obj
    expires_in 1.hour, public: true
  end
end
