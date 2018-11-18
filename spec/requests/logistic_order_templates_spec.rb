require 'rails_helper'

RSpec.describe "LogisticOrderTemplates", type: :request do
  describe "GET /logistic_order_templates" do
    it "works! (now write some real specs)" do
      get logistic_order_templates_path
      expect(response).to have_http_status(200)
    end
  end
end
