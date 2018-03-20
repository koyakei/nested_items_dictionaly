require 'rails_helper'

RSpec.describe "YamatoPackingItemCodes", type: :request do
  describe "GET /yamato_packing_item_codes" do
    it "works! (now write some real specs)" do
      get yamato_packing_item_codes_path
      expect(response).to have_http_status(200)
    end
  end
end
