require "rails_helper"

RSpec.describe MakersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/makers").to route_to("makers#index")
    end


    it "routes to #show" do
      expect(:get => "/makers/1").to route_to("makers#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/makers").to route_to("makers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/makers/1").to route_to("makers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/makers/1").to route_to("makers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/makers/1").to route_to("makers#destroy", :id => "1")
    end

  end
end
