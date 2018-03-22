require "rails_helper"

RSpec.describe TagItemsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/tag_items").to route_to("tag_items#index")
    end


    it "routes to #show" do
      expect(:get => "/tag_items/1").to route_to("tag_items#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/tag_items").to route_to("tag_items#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/tag_items/1").to route_to("tag_items#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/tag_items/1").to route_to("tag_items#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/tag_items/1").to route_to("tag_items#destroy", :id => "1")
    end

  end
end
