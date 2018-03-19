require "rails_helper"

RSpec.describe Admin::MakersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/makers").to route_to("admin/makers#index")
    end


    it "routes to #show" do
      expect(:get => "/admin/makers/1").to route_to("admin/makers#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/admin/makers").to route_to("admin/makers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/admin/makers/1").to route_to("admin/makers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin/makers/1").to route_to("admin/makers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/makers/1").to route_to("admin/makers#destroy", :id => "1")
    end

  end
end
