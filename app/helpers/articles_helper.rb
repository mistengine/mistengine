module ArticlesHelper
  def article_path(article, options={})
    article_url(article, options.merge(:only_path => true))
  end

  def article_url(post, options={})
    url_for(options.merge(:controller => 'articles', :action => 'show', :type => post.type.downcase, :id => post.id, :slug => post.slug))
  end
end
