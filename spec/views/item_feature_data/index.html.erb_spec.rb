require 'rails_helper'

RSpec.describe "item_feature_data/index", type: :view do
  before(:each) do
    assign(:item_feature_data, [
      ItemFeatureDatum.create!(
        :item => nil,
        :number => 2,
        :feature => "MyText"
      ),
      ItemFeatureDatum.create!(
        :item => nil,
        :number => 2,
        :feature => "MyText"
      )
    ])
  end

  it "renders a list of item_feature_data" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
