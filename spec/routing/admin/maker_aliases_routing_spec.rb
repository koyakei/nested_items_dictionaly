require "rails_helper"

RSpec.describe Admin::MakerAliasesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/maker_aliases").to route_to("admin/maker_aliases#index")
    end


    it "routes to #show" do
      expect(:get => "/admin/maker_aliases/1").to route_to("admin/maker_aliases#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/admin/maker_aliases").to route_to("admin/maker_aliases#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/admin/maker_aliases/1").to route_to("admin/maker_aliases#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin/maker_aliases/1").to route_to("admin/maker_aliases#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/maker_aliases/1").to route_to("admin/maker_aliases#destroy", :id => "1")
    end

  end
end
