class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  unless Rails.env.development?
    http_basic_authenticate_with name: "product", password: ENV["BASIC_PASSWORD"]
  end
end
