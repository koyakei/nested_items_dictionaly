require "rails_helper"

RSpec.describe ItemFeatureDataController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/item_feature_data").to route_to("item_feature_data#index")
    end

    it "routes to #new" do
      expect(:get => "/item_feature_data/new").to route_to("item_feature_data#new")
    end

    it "routes to #show" do
      expect(:get => "/item_feature_data/1").to route_to("item_feature_data#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/item_feature_data/1/edit").to route_to("item_feature_data#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/item_feature_data").to route_to("item_feature_data#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/item_feature_data/1").to route_to("item_feature_data#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/item_feature_data/1").to route_to("item_feature_data#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/item_feature_data/1").to route_to("item_feature_data#destroy", :id => "1")
    end

  end
end
