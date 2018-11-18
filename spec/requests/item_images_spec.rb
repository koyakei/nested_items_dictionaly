require 'rails_helper'

RSpec.describe "ItemImages", type: :request do
  describe "GET /item_images" do
    it "works! (now write some real specs)" do
      get item_images_path
      expect(response).to have_http_status(200)
    end
  end
end
