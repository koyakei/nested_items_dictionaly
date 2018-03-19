require 'rails_helper'

RSpec.describe "Admin::Makers", type: :request do
  describe "GET /admin_makers" do
    it "works! (now write some real specs)" do
      get admin_makers_path
      expect(response).to have_http_status(200)
    end
  end
end
