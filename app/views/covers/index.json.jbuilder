json.array!(@covers) do |cover|
  json.extract! cover, :id, :article_id, :title, :url, :description, :active, :weight
  json.url cover_url(cover, format: :json)
end
