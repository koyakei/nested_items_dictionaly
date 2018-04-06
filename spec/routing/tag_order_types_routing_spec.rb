require "rails_helper"

RSpec.describe TagOrderTypesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/tag_order_types").to route_to("tag_order_types#index")
    end


    it "routes to #show" do
      expect(:get => "/tag_order_types/1").to route_to("tag_order_types#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/tag_order_types").to route_to("tag_order_types#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/tag_order_types/1").to route_to("tag_order_types#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/tag_order_types/1").to route_to("tag_order_types#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/tag_order_types/1").to route_to("tag_order_types#destroy", :id => "1")
    end

  end
end
