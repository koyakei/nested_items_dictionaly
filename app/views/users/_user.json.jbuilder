json.extract! user, :id, :cognito_id, :created_at, :updated_at
json.url user_url(user, format: :json)
