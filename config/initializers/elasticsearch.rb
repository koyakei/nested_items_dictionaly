Searchkick.redis = Redis.new
unless Rails.env.test? || Rails.env.development?
  Searchkick.aws_credentials = {
    access_key_id: Rails.application.credentials[Rails.env.to_sym][:aws][:access_key_id],
    secret_access_key: Rails.application.credentials[Rails.env.to_sym][:aws][:secret_access_key],
    region: "ap-northeast-1"
  }
end