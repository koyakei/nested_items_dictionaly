require 'rails_helper'

RSpec.describe Item, type: :model do
  # , name: "mobile", maker: Maker.first!, creator: User.first!, parent_item: Item.first!
  apple_name = "Apple"
  apple = Maker.new(name: apple_name, creator: User.first)
  apple.save!
  item2 = Fabricate.build(:item)
  item2.save!

  yamato_logistic_order_template =
    LogisticOrderTemplatable::Yamato::LogisticOrderTemplate.new
  yamato_logistic_order_template.yamato_packing_item_code =
    LogisticOrderTemplatable::Yamato::Elements::PackingItemCode.first!
  yamato_logistic_order_template.yamato_size_item_code =
    LogisticOrderTemplatable::Yamato::Elements::SizeItemCode.second!
  yamato_logistic_order_template.yamato_handling_type_code1 =
    LogisticOrderTemplatable::Yamato::Elements::HandlingTypeCode.first!
  yamato_logistic_order_template.yamato_handling_type_code2 =
    LogisticOrderTemplatable::Yamato::Elements::HandlingTypeCode.first!
  yamato_logistic_order_template.creator = User.first
  yamato_logistic_order_template.save!

  logistic_order_template = LogisticOrderTemplate.new
  logistic_order_template.item = Item.first
  logistic_order_template.logistic_order_templatable =
    yamato_logistic_order_template
  logistic_order_template.creator = User.first
  logistic_order_template.save!


  item3 = Fabricate.build(:item, name: "iPhone", maker: apple, parent_item: item2)
  item3.creator = User.first
  item3.save!(validate: false)
  item4_name = "iPhone 6"
  item4 = Fabricate.build(:item, name: item4_name, maker: nil, parent_item: item3, has_child: false)
  item4.creator = User.first
  item4.save!

  item5 = Fabricate.build(:item, name: "Android", maker: nil, parent_item: item4, has_child: false)
  item5.creator = User.first
  item5.save!

  describe "#get nested items" do
    subject { item.set_values }
    context "ルートとその直下の関係性の取得がかのうであるかどうか？" do
      # 直下のitem を作成
      # let(:item2) { Fabricate(:item, parent_item: Item.first, name: "second") }
      # item3_set = item3.set_values
      item4_set = item4.set_values
      # it { expect(item2.maker.id).to eq Maker.where(name: "不明").first.id }
      # it { expect(item3.maker.id).to eq Maker.where(name: apple_name).first.id }
      it { expect(item4_set["max_threshold_price"]).to eq 2_147_483_647 }
      it { expect(item4_set["maker_id"]).to eq apple.id }
      # it { expect(item4_set["name"]).to eq item4_name }
      # it { item2.logistic_order_templates.first.}
    end
  end

  describe "update" do
    item4_set = item4.set_values

  end
end
