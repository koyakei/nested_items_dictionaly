require "rails_helper"

RSpec.describe StandardUnitsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/standard_units").to route_to("standard_units#index")
    end


    it "routes to #show" do
      expect(:get => "/standard_units/1").to route_to("standard_units#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/standard_units").to route_to("standard_units#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/standard_units/1").to route_to("standard_units#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/standard_units/1").to route_to("standard_units#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/standard_units/1").to route_to("standard_units#destroy", :id => "1")
    end

  end
end
