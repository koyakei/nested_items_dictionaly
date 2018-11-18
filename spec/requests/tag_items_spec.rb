require 'rails_helper'

RSpec.describe "TagItems", type: :request do
  describe "GET /tag_items" do
    it "works! (now write some real specs)" do
      get tag_items_path
      expect(response).to have_http_status(200)
    end
  end
end
