require 'rails_helper'

RSpec.describe "ItemFeatureData", type: :request do
  describe "GET /item_feature_data" do
    it "works! (now write some real specs)" do
      get item_feature_data_path
      expect(response).to have_http_status(200)
    end
  end
end
