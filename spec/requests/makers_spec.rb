require 'rails_helper'

RSpec.describe "Makers", type: :request do
  describe "GET /makers" do
    it "works! (now write some real specs)" do
      get makers_path
      expect(response).to have_http_status(200)
    end
  end
end
