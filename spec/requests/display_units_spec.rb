require 'rails_helper'

RSpec.describe "DisplayUnits", type: :request do
  describe "GET /display_units" do
    it "works! (now write some real specs)" do
      get display_units_path
      expect(response).to have_http_status(200)
    end
  end
end
