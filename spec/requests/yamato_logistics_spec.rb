require 'rails_helper'

RSpec.describe "YamatoLogistics", type: :request do
  describe "GET /yamato_logistics" do
    it "works! (now write some real specs)" do
      get yamato_logistics_path
      expect(response).to have_http_status(200)
    end
  end
end
