require 'rails_helper'

RSpec.describe "ItemAttributeTypes", type: :request do
  describe "GET /item_attribute_types" do
    it "works! (now write some real specs)" do
      get item_attribute_types_path
      expect(response).to have_http_status(200)
    end
  end
end
