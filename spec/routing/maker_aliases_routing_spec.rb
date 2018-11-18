require "rails_helper"

RSpec.describe MakerAliasesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/maker_aliases").to route_to("maker_aliases#index")
    end


    it "routes to #show" do
      expect(:get => "/maker_aliases/1").to route_to("maker_aliases#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/maker_aliases").to route_to("maker_aliases#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/maker_aliases/1").to route_to("maker_aliases#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/maker_aliases/1").to route_to("maker_aliases#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/maker_aliases/1").to route_to("maker_aliases#destroy", :id => "1")
    end

  end
end
