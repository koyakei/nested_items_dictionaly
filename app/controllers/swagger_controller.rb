class SwaggerController < ApplicationController
  def index
    file = YAML.load(ERB.new(File.read("#{Rails.root}/config/swagger.yml.erb")).result)[Rails.env]
    json = JSON.pretty_generate(file)
    render json: json
  end
end