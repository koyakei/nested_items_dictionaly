require 'rails_helper'

RSpec.describe "ItemAdditionalConditions", type: :request do
  describe "GET /item_additional_conditions" do
    it "works! (now write some real specs)" do
      get item_additional_conditions_path
      expect(response).to have_http_status(200)
    end
  end
end
