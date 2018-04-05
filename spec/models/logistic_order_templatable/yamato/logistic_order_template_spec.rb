require 'rails_helper'

RSpec.describe LogisticOrderTemplatable::Yamato::LogisticOrderTemplate, type: :model do

  describe "ネスト" do
    apple_name = "Apple"
    apple = Maker.new(name: apple_name, creator: User.first)
    apple.save!
    item2 = Fabricate.build(:item, name: :moblie)
    item2.save!
    item2_size =
      LogisticOrderTemplatable::Yamato::Elements::SizeItemCode.second!
    yamato_logistic_order_template =
      LogisticOrderTemplatable::Yamato::LogisticOrderTemplate.new
    yamato_logistic_order_template.yamato_packing_item_code =
      LogisticOrderTemplatable::Yamato::Elements::PackingItemCode.first!
    yamato_logistic_order_template.yamato_size_item_code = item2_size
    yamato_logistic_order_template.yamato_handling_type_code1 =
      LogisticOrderTemplatable::Yamato::Elements::HandlingTypeCode.first!
    yamato_logistic_order_template.yamato_handling_type_code2 =
      LogisticOrderTemplatable::Yamato::Elements::HandlingTypeCode.first!
    yamato_logistic_order_template.creator = User.first
    yamato_logistic_order_template.save!

    logistic_order_template = LogisticOrderTemplate.new
    logistic_order_template.item = item2
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
    context "一階層目の取得" do
      template = item2.logistic_order_templates.find_by(
        logistic_order_templatable_type:
          LogisticOrderTemplatable::Yamato::LogisticOrderTemplate.to_s)
      table = template.logistic_order_templatable.yamato_size_item_code
      it { expect(table).to eq item2_size }
    end



    context "2層目の取得" do
      item3_set = item3.set_values
      item3tmp = LogisticOrderTemplate.where(
        logistic_order_templatable_type:
          LogisticOrderTemplatable::Yamato::LogisticOrderTemplate.to_s,
        item_id: item3_set["category_path"].split(","))
      item3tmp.first.id
      yr = LogisticOrderTemplatable::Yamato::LogisticOrderTemplate.new.set_values(item3.id)

      it{ expect(yr["size"]).to eq item2_size.size}
    end
  end
end
