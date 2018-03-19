require 'rails_helper'

RSpec.describe "Admin::YamatoPackingItemCodes", type: :request do
  describe "GET /admin_yamato_packing_item_codes" do
    it "works! (now write some real specs)" do
      get admin_yamato_packing_item_codes_path
      expect(response).to have_http_status(200)
    end
  end
end
