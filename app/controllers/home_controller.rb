class HomeController < ApplicationController
  def index
    @articles = Rails.cache.fetch 'index-articles' do
      Article.paginates(0).load
    end

    times = [@articles.first].inject({}) do |package, elm|
      package[elm] = elm.updated_at
      package
    end

    last_modified = times.values.max
    etag_obj = times.key(last_modified)

    fresh_when last_modified: last_modified, etag: etag_obj
  end
end
