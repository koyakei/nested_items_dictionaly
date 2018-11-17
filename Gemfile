source "https://rubygems.org"

# Bundle edge Rails instead: gem "rails", github: "rails/rails"
gem "rails", "5.2"
# Use sqlite3 as the database for Active Record
gem "pg"
# Use Puma as the app server
gem "puma"
# Use SCSS for stylesheets
gem "sass-rails"
# Use Uglifier as compressor for JavaScript assets
gem "uglifier", ">= 1.3.0"
# Use CoffeeScript for .coffee assets and views
gem "coffee-rails", "~> 4.2"
gem "rack-cors"
# Use jquery as the JavaScript library
gem "jquery-rails"
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "turbolinks"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder"
# Use Redis adapter to run Action Cable in production
# gem "redis", "3.0"
# Use ActiveModel has_secure_password
gem "csv"
gem "rubocop"
gem "searchkick"
gem "jwt"

group :production do
  gem "faraday_middleware-aws-sigv4"
end

group :development, :test do
  gem "rspec-rails"
  gem "fabrication"
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem "web-console"
  gem "listen"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen"

  # DB
  gem "annotate"
  gem "migration_comments"
  gem "squasher"
end

group :test do
  gem "rspec"
  gem "database_rewinder"
  # gem "rspec-request_describer"
  gem "json_spec"
end

# gem "grape"                   # Grapeを使うときのGem
# gem "grape-entity"            # 1対多のデータ構造を書くときに使う
# gem "grape-swagger"           # Grapeで定義したAPIをSwagger形式でドキュメント化するために使う
# gem "grape-swagger-ui"
# gem "grape-swagger-entity"    # レスポンスモデルをSwaggerで見られる形式にするときに使う
# gem "grape-swagger-rails"
# gem "grape-active_model_serializers"
# gem "grape_on_rails_routes"
# gem "grape_logging"

gem "aws-sdk"