require "rails_helper"

RSpec.describe LogisticOrderTemplatesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/logistic_order_templates").to route_to("logistic_order_templates#index")
    end


    it "routes to #show" do
      expect(:get => "/logistic_order_templates/1").to route_to("logistic_order_templates#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/logistic_order_templates").to route_to("logistic_order_templates#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/logistic_order_templates/1").to route_to("logistic_order_templates#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/logistic_order_templates/1").to route_to("logistic_order_templates#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/logistic_order_templates/1").to route_to("logistic_order_templates#destroy", :id => "1")
    end

  end
end
