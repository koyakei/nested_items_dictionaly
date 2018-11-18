require 'rails_helper'

RSpec.describe "ItemGradesDiscounts", type: :request do
  describe "GET /item_grades_discounts" do
    it "works! (now write some real specs)" do
      get item_grades_discounts_path
      expect(response).to have_http_status(200)
    end
  end
end
