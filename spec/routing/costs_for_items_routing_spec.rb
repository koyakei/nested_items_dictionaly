require "rails_helper"

RSpec.describe CostsForItemsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/costs_for_items").to route_to("costs_for_items#index")
    end


    it "routes to #show" do
      expect(:get => "/costs_for_items/1").to route_to("costs_for_items#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/costs_for_items").to route_to("costs_for_items#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/costs_for_items/1").to route_to("costs_for_items#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/costs_for_items/1").to route_to("costs_for_items#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/costs_for_items/1").to route_to("costs_for_items#destroy", :id => "1")
    end

  end
end
