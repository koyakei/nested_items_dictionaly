require "rails_helper"

RSpec.describe ItemAttributeTypesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/item_attribute_types").to route_to("item_attribute_types#index")
    end


    it "routes to #show" do
      expect(:get => "/item_attribute_types/1").to route_to("item_attribute_types#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/item_attribute_types").to route_to("item_attribute_types#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/item_attribute_types/1").to route_to("item_attribute_types#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/item_attribute_types/1").to route_to("item_attribute_types#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/item_attribute_types/1").to route_to("item_attribute_types#destroy", :id => "1")
    end

  end
end
