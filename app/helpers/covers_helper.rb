module CoversHelper
  def cover_path(cover, options={})
    cover_url(cover, options.merge(only_path: true))
  end

  def cover_url(cover, options={})
    unless params[:admin] == true
      if cover.url.present?
        cover.url
      elsif cover.article_id.present?
        article = cover.article
        url_for(options.merge(controller: 'articles', action: 'show', type: article.type.downcase, id: article.id, slug: article.slug))
      else
        url_for(options.merge(controller: 'covers', action: 'show', id: cover.id))
      end
    else
      super
    end
  end
end
