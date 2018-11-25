json.extract! mylink, :id, :link, :created_at, :updated_at
json.url mylink_url(mylink, format: :json)
