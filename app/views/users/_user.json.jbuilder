json.extract! user, :id, :username, :email, :password_digest, :address, :phone_number, :created_at, :updated_at
json.url user_url(user, format: :json)
