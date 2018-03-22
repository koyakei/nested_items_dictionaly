require 'rails_helper'

RSpec.describe "YamatoLogisticOrderTemplates", type: :request do
  describe "GET /yamato_logistic_order_templates" do
    it "works! (now write some real specs)" do
      get yamato_logistic_order_templates_path
      expect(response).to have_http_status(200)
    end
  end
end
