require 'rails_helper'

RSpec.describe "AdditionalConditions", type: :request do
  describe "GET /additional_conditions" do
    it "works! (now write some real specs)" do
      get additional_conditions_path
      expect(response).to have_http_status(200)
    end
  end
end
