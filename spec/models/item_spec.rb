require "rails_helper"

RSpec.describe Item, type: :model do
  describe "#get nested items" do
    apple_name = "Apple"
    apple = Maker.new(name: apple_name, creator: User.first!)
    apple.save!
    item2 = Fabricate.build(:item, name: "test 2", parent_item: Item.first!)
    item2.save!
    item2_value = 10
    second_display_unit = DisplayUnit.find_by_standard_unit_id(StandardUnit.second!.id)
    item_attribute_type = ItemAttributeType.new(value: item2_value, item: item2, attribute_type: AttributeType.find_by_standard_unit_id(StandardUnit.second!.id),
                                                display_unit: second_display_unit, creator: User.first!)
    item_attribute_type.save!
    ItemAttributeType.new(value: 20, item: item2, attribute_type: AttributeType.find_by_standard_unit_id(StandardUnit.first!.id),
                          display_unit: DisplayUnit.find_by_standard_unit_id(StandardUnit.first!.id), creator: User.first!).save!
    sony_name = "sony"
    sony = Maker.new(name: sony_name, creator: User.first!)
    sony.save!
    tag = Tag.new(name: :test_tag)
    tag.save!
    yamato_logistic_order_template = LogisticOrderTemplatable::Yamato::LogisticOrderTemplate.new
    yamato_logistic_order_template.yamato_packing_item_code = LogisticOrderTemplatable::Yamato::Elements::PackingItemCode.first!
    yamato_logistic_order_template.yamato_size_item_code = LogisticOrderTemplatable::Yamato::Elements::SizeItemCode.second!
    yamato_logistic_order_template.yamato_handling_type_code1 = LogisticOrderTemplatable::Yamato::Elements::HandlingTypeCode.first!
    yamato_logistic_order_template.yamato_handling_type_code2 = LogisticOrderTemplatable::Yamato::Elements::HandlingTypeCode.first!
    yamato_logistic_order_template.creator = User.first
    yamato_logistic_order_template.save!

    logistic_order_template = LogisticOrderTemplate.new
    logistic_order_template.item = Item.first
    logistic_order_template.logistic_order_templatable = yamato_logistic_order_template
    logistic_order_template.creator = User.first
    logistic_order_template.save!

    item3 = Fabricate.build(:item, name: "iPhone", maker: apple, parent_item: item2, min_threshold_price: 1)
    item3.tags << tag
    item3.creator = User.first!
    item3.save!(validate: false)
    ItemAttributeType.new(value: 30, item: item3, attribute_type: AttributeType.find_by_standard_unit_id(StandardUnit.second!.id),
                          display_unit: DisplayUnit.find_by_standard_unit_id(StandardUnit.second!.id), creator: User.first!).save!
    item4_name = "iPhone 6"
    item4 = Fabricate.build(:item, name: item4_name, maker: nil, parent_item: item3, has_child: false)
    item4.creator = User.first
    item4.save!

    item5 = Fabricate.build(:item, name: "Android", maker: nil, parent_item: item2, has_child: false)
    item5.creator = User.first
    item5.save!

    context "商品情報検索 with searchkick" do
      Item.reindex
      sleep(20)
      # {"query":{"bool":{"must":[{"term":{"unit.サイズ":"0.0062137119223733"}}],"must_not":[],"should":[]}},"from":0,"size":10,"sort":[],"aggs":{}}
      items = Item.search("*", where: { "unit.#{AttributeType.find_by_standard_unit_id(StandardUnit.second!.id).name}" => 30000000 }.compact)

      it { expect(items.size).to eq 1 }
    end

    context "tag 付与" do
      it { expect(item3.tags.first).to eq tag }
    end

    context "ルートとその直下の関係性の取得がかのうであるかどうか？" do
      item3_set = item3.set_values
      item4_set = item4.set_values
      item5_set = item5.set_values
      it { expect(item3_set["min_threshold_price"]).to eq 1 }
      it { expect(item4_set["min_threshold_price"]).to eq 1 }
      it { expect(item3_set["maker_id"]).to eq apple.id }
      it { expect(item4_set["max_threshold_price"]).to eq 2_147_483_647 }
      it { expect(item4_set["maker_root_id"]).to eq item3.id }
      it { expect(item5_set["maker_root_id"]).to eq Item.first.id }
      it { expect(item3_set["is_visible"]).to eq true }
      it { expect(item4_set["maker_id"]).to eq apple.id }
    end

    context "find children" do
      res = Item.find(item3.id)
      it { expect(res.children_items).not_to be_nil }
      it { expect(res.children_items).to eq item3.children_items }
    end

    context "find parent" do
      it { expect(item3.parent_item).to be item2 }
    end

    context "reindex" do
      item2.maker = sony
      item2.save!
      item5.reindex
      data = item5.search_data
      sleep(10)
      it { expect(data).not_to be_nil }
      it { expect(data[:maker_id]).to eq sony.id }
    end

    context "親までのcategory_path 取得" do
      item3_set = item3.set_values
      it { expect(item3_set["category_path"]).to eq "#{Item.first.id},#{item2.id},#{item3.id}" }
    end

    context "update" do
      after_changed_name = "Andriod2"
      item4.name = after_changed_name
      item4.save!
      it { expect(item4.name).to eq after_changed_name }
    end

    context "cascading destroy" do
      item4.destroy!
      item3.destroy!
      item5.destroy!
      item2.destroy!
      it { expect(LogisticOrderTemplatable::Yamato::LogisticOrderTemplate.find_by_id(yamato_logistic_order_template.id)).to be_nil }
    end
  end
end
