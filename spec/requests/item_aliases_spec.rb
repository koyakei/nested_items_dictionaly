require 'rails_helper'

RSpec.describe "ItemAliases", type: :request do
  describe "GET /item_aliases" do
    it "works! (now write some real specs)" do
      get item_aliases_path
      expect(response).to have_http_status(200)
    end
  end
end
