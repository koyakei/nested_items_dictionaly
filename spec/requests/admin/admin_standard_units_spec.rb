require 'rails_helper'

RSpec.describe "Admin::StandardUnits", type: :request do
  describe "GET /admin_standard_units" do
    it "works! (now write some real specs)" do
      get admin_standard_units_path
      expect(response).to have_http_status(200)
    end
  end
end
