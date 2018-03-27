require 'rails_helper'

RSpec.describe "AttributeTypes", type: :request do
  describe "GET /attribute_types" do
    it "works! (now write some real specs)" do
      get attribute_types_path
      expect(response).to have_http_status(200)
    end
  end
end
