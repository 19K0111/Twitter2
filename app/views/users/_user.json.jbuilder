json.extract! user, :id, :email, :screen_name, :user_name, :language, :created_at, :updated_at
json.url user_url(user, format: :json)
