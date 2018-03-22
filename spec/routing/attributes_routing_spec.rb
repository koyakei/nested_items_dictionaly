require "rails_helper"

RSpec.describe AttributesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/attributes").to route_to("attributes#index")
    end


    it "routes to #show" do
      expect(:get => "/attributes/1").to route_to("attributes#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/attributes").to route_to("attributes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/attributes/1").to route_to("attributes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/attributes/1").to route_to("attributes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/attributes/1").to route_to("attributes#destroy", :id => "1")
    end

  end
end
