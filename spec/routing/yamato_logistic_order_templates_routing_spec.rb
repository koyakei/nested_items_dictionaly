require "rails_helper"

RSpec.describe YamatoLogisticOrderTemplatesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/yamato_logistic_order_templates").to route_to("yamato_logistic_order_templates#index")
    end


    it "routes to #show" do
      expect(:get => "/yamato_logistic_order_templates/1").to route_to("yamato_logistic_order_templates#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/yamato_logistic_order_templates").to route_to("yamato_logistic_order_templates#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/yamato_logistic_order_templates/1").to route_to("yamato_logistic_order_templates#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/yamato_logistic_order_templates/1").to route_to("yamato_logistic_order_templates#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/yamato_logistic_order_templates/1").to route_to("yamato_logistic_order_templates#destroy", :id => "1")
    end

  end
end
