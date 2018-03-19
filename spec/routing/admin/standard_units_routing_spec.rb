require "rails_helper"

RSpec.describe Admin::StandardUnitsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/standard_units").to route_to("admin/standard_units#index")
    end


    it "routes to #show" do
      expect(:get => "/admin/standard_units/1").to route_to("admin/standard_units#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/admin/standard_units").to route_to("admin/standard_units#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/admin/standard_units/1").to route_to("admin/standard_units#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin/standard_units/1").to route_to("admin/standard_units#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/standard_units/1").to route_to("admin/standard_units#destroy", :id => "1")
    end

  end
end
