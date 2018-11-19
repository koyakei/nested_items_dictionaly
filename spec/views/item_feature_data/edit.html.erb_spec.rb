require 'rails_helper'

RSpec.describe "item_feature_data/edit", type: :view do
  before(:each) do
    @item_feature_datum = assign(:item_feature_datum, ItemFeatureDatum.create!(
      :item => nil,
      :number => 1,
      :feature => "MyText"
    ))
  end

  it "renders the edit item_feature_datum form" do
    render

    assert_select "form[action=?][method=?]", item_feature_datum_path(@item_feature_datum), "post" do

      assert_select "input[name=?]", "item_feature_datum[item_id]"

      assert_select "input[name=?]", "item_feature_datum[number]"

      assert_select "textarea[name=?]", "item_feature_datum[feature]"
    end
  end
end
