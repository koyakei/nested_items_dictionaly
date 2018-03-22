require "rails_helper"

RSpec.describe ItemGradesDiscountsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/item_grades_discounts").to route_to("item_grades_discounts#index")
    end


    it "routes to #show" do
      expect(:get => "/item_grades_discounts/1").to route_to("item_grades_discounts#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/item_grades_discounts").to route_to("item_grades_discounts#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/item_grades_discounts/1").to route_to("item_grades_discounts#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/item_grades_discounts/1").to route_to("item_grades_discounts#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/item_grades_discounts/1").to route_to("item_grades_discounts#destroy", :id => "1")
    end

  end
end
