require 'rails_helper'

RSpec.describe "item_feature_data/show", type: :view do
  before(:each) do
    @item_feature_datum = assign(:item_feature_datum, ItemFeatureDatum.create!(
      :item => nil,
      :number => 2,
      :feature => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/MyText/)
  end
end
