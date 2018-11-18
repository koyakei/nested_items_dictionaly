require 'rails_helper'

RSpec.describe "YamatoHandlingTypeCodes", type: :request do
  describe "GET /yamato_handling_type_codes" do
    it "works! (now write some real specs)" do
      get yamato_handling_type_codes_path
      expect(response).to have_http_status(200)
    end
  end
end
