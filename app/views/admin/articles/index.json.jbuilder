json.array!(@articles) do |article|
  json.extract! article, :id, :title, :blurb, :text, :settings, :type, :published_at, :review_score, :sidebar, :original_id, :byline, :comment_count
  json.url article_url(article, format: :json)
end
