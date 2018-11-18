require 'rails_helper'

RSpec.describe "Admin::MakerAliases", type: :request do
  describe "GET /admin_maker_aliases" do
    it "works! (now write some real specs)" do
      get admin_maker_aliases_path
      expect(response).to have_http_status(200)
    end
  end
end
