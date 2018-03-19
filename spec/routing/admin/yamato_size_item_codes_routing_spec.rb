require "rails_helper"

RSpec.describe Admin::YamatoSizeItemCodesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/yamato_size_item_codes").to route_to("admin/yamato_size_item_codes#index")
    end


    it "routes to #show" do
      expect(:get => "/admin/yamato_size_item_codes/1").to route_to("admin/yamato_size_item_codes#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/admin/yamato_size_item_codes").to route_to("admin/yamato_size_item_codes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/admin/yamato_size_item_codes/1").to route_to("admin/yamato_size_item_codes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin/yamato_size_item_codes/1").to route_to("admin/yamato_size_item_codes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/yamato_size_item_codes/1").to route_to("admin/yamato_size_item_codes#destroy", :id => "1")
    end

  end
end
