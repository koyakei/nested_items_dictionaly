require 'rails_helper'

RSpec.describe "TagOrderTypes", type: :request do
  describe "GET /tag_order_types" do
    it "works! (now write some real specs)" do
      get tag_order_types_path
      expect(response).to have_http_status(200)
    end
  end
end
