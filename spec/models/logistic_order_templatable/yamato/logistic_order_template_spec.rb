require 'rails_helper'

RSpec.describe LogisticOrderTemplatable::Yamato::LogisticOrderTemplate, type: :model do
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


  item3 = Fabricate.build(:item, name: "iPhone", maker: apple, parent_item: item2, min_threshold_price: 1)
  item3.creator = User.first
  item3.save!(validate: false)
  item4_name = "iPhone 6"
  item4 = Fabricate.build(:item, name: item4_name, maker: nil, parent_item: item3, has_child: false)
  item4.creator = User.first
  item4.save!

  item5 = Fabricate.build(:item, name: "Android", maker: nil, parent_item: item4, has_child: false)
  item5.creator = User.first
  item5.save!
  describe "ネスト" do
    subject { yamato_logistic_order_template.set_values }
  end
end
