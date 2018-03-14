require "rails_helper"

RSpec.describe AdditionalConditionsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/additional_conditions").to route_to("additional_conditions#index")
    end


    it "routes to #show" do
      expect(:get => "/additional_conditions/1").to route_to("additional_conditions#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/additional_conditions").to route_to("additional_conditions#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/additional_conditions/1").to route_to("additional_conditions#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/additional_conditions/1").to route_to("additional_conditions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/additional_conditions/1").to route_to("additional_conditions#destroy", :id => "1")
    end

  end
end
