require "rails_helper"

RSpec.describe DisplayUnitsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/display_units").to route_to("display_units#index")
    end


    it "routes to #show" do
      expect(:get => "/display_units/1").to route_to("display_units#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/display_units").to route_to("display_units#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/display_units/1").to route_to("display_units#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/display_units/1").to route_to("display_units#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/display_units/1").to route_to("display_units#destroy", :id => "1")
    end

  end
end
