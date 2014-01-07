json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :password, :active, :blurb, :title
  json.url user_url(user, format: :json)
end
