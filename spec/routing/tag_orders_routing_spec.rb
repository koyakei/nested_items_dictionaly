require "rails_helper"

RSpec.describe TagOrdersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/tag_orders").to route_to("tag_orders#index")
    end


    it "routes to #show" do
      expect(:get => "/tag_orders/1").to route_to("tag_orders#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/tag_orders").to route_to("tag_orders#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/tag_orders/1").to route_to("tag_orders#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/tag_orders/1").to route_to("tag_orders#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/tag_orders/1").to route_to("tag_orders#destroy", :id => "1")
    end

  end
end
