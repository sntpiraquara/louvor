json.extract! music, :id, :name, :author, :lyrics, :created_at, :updated_at
json.url music_url(music, format: :json)
