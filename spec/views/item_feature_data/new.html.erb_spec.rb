require 'rails_helper'

RSpec.describe "item_feature_data/new", type: :view do
  before(:each) do
    assign(:item_feature_datum, ItemFeatureDatum.new(
      :item => nil,
      :number => 1,
      :feature => "MyText"
    ))
  end

  it "renders new item_feature_datum form" do
    render

    assert_select "form[action=?][method=?]", item_feature_data_path, "post" do

      assert_select "input[name=?]", "item_feature_datum[item_id]"

      assert_select "input[name=?]", "item_feature_datum[number]"

      assert_select "textarea[name=?]", "item_feature_datum[feature]"
    end
  end
end
