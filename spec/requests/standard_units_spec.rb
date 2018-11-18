require 'rails_helper'

RSpec.describe "StandardUnits", type: :request do
  describe "GET /standard_units" do
    it "works! (now write some real specs)" do
      get standard_units_path
      expect(response).to have_http_status(200)
    end
  end
end
