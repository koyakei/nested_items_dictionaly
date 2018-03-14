require 'rails_helper'

RSpec.describe "ItemAttributes", type: :request do
  describe "GET /item_attributes" do
    it "works! (now write some real specs)" do
      get item_attributes_path
      expect(response).to have_http_status(200)
    end
  end
end
