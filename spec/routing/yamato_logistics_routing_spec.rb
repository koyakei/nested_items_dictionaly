require "rails_helper"

RSpec.describe YamatoLogisticsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/yamato_logistics").to route_to("yamato_logistics#index")
    end


    it "routes to #show" do
      expect(:get => "/yamato_logistics/1").to route_to("yamato_logistics#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/yamato_logistics").to route_to("yamato_logistics#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/yamato_logistics/1").to route_to("yamato_logistics#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/yamato_logistics/1").to route_to("yamato_logistics#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/yamato_logistics/1").to route_to("yamato_logistics#destroy", :id => "1")
    end

  end
end
