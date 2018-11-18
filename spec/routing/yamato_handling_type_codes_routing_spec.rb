require "rails_helper"

RSpec.describe YamatoHandlingTypeCodesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/yamato_handling_type_codes").to route_to("yamato_handling_type_codes#index")
    end


    it "routes to #show" do
      expect(:get => "/yamato_handling_type_codes/1").to route_to("yamato_handling_type_codes#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/yamato_handling_type_codes").to route_to("yamato_handling_type_codes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/yamato_handling_type_codes/1").to route_to("yamato_handling_type_codes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/yamato_handling_type_codes/1").to route_to("yamato_handling_type_codes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/yamato_handling_type_codes/1").to route_to("yamato_handling_type_codes#destroy", :id => "1")
    end

  end
end
