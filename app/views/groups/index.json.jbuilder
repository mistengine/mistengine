json.array!(@groups) do |group|
  json.extract! group, :id, :title, :description, :permissions, :active
  json.url group_url(group, format: :json)
end
