user = User.new(id: 0)
user.save!
maker = Maker.new(id: 0, description: "unknown", name: "不明", creator: User.first)
maker.save!

item = Item.new(id: 0, name: "全部", maker: maker, description: "全部",
                max_threshold_price: 2_147_483_647,
                min_threshold_price: 0, creator: User.first)
item.save!(validate: false)

CSV.foreach("db/seeds/csv/yamato_packing_item_codes.csv") do |row|
  LogisticOrderTemplatable::Yamato::Elements::PackingItemCode.new(
    code: row[0], name: row[1]).save!
end

CSV.foreach("db/seeds/csv/yamato_size_item_codes.csv") do |row|
  LogisticOrderTemplatable::Yamato::Elements::SizeItemCode.new(
    code_from: row[0], name_from: row[1],
    code_to: row[2], name_to: row[3], size: row[4]).save!
end

CSV.foreach("db/seeds/csv/yamato_handling_type_codes.csv") do |row|
  LogisticOrderTemplatable::Yamato::Elements::HandlingTypeCode.new(
    code: row[0], name: row[1]).save!
end

yamato_logistic_order_template =
  LogisticOrderTemplatable::Yamato::LogisticOrderTemplate.new
yamato_logistic_order_template.yamato_size_item_code =
  LogisticOrderTemplatable::Yamato::Elements::SizeItemCode.first!
yamato_logistic_order_template.yamato_packing_item_code =
  LogisticOrderTemplatable::Yamato::Elements::PackingItemCode.first!
yamato_logistic_order_template.yamato_handling_type_code1 =
  LogisticOrderTemplatable::Yamato::Elements::HandlingTypeCode.first!
yamato_logistic_order_template.yamato_handling_type_code2 =
  LogisticOrderTemplatable::Yamato::Elements::HandlingTypeCode.first!
yamato_logistic_order_template.creator = User.first!
yamato_logistic_order_template.save!

logistic_order_template = LogisticOrderTemplate.new
logistic_order_template.item = Item.first
logistic_order_template.logistic_order_templatable = yamato_logistic_order_template
logistic_order_template.creator = User.first
logistic_order_template.save!

gram = StandardUnit.new(name: "g")
gram.save!

centimeter = StandardUnit.new(name: "cm")
centimeter.save!

# http://www.calc-site.com/units/weight
DisplayUnit.create!(standard_unit: gram, name: 'μg', display_ratio: 1_000_000, creator: user)
DisplayUnit.create!(standard_unit: gram, name: 'mg', display_ratio: 1_000, creator: user)
DisplayUnit.create!(standard_unit: gram, name: 'g',  display_ratio: 1, creator: user)
DisplayUnit.create!(standard_unit: gram, name: 'kg', display_ratio: 0.001, creator: user)
DisplayUnit.create!(standard_unit: gram, name: 't',  display_ratio: 0.000_001, creator: user)
DisplayUnit.create!(standard_unit: gram, name: 'oz', display_ratio: 0.035_273_961_949_58	, creator: user)
DisplayUnit.create!(standard_unit: gram, name: 'lb', display_ratio: 0.002_204_622_621_84_88, creator: user)
DisplayUnit.create!(standard_unit: gram, name: 'ct', display_ratio: 5, creator: user)

# http://www.calc-site.com/units/length
DisplayUnit.create!(standard_unit: centimeter, name: 'μm', display_ratio: 10_000, creator: user)
DisplayUnit.create!(standard_unit: centimeter, name: 'mm', display_ratio: 10, creator: user)
DisplayUnit.create!(standard_unit: centimeter, name: 'cm', display_ratio: 1, creator: user)
DisplayUnit.create!(standard_unit: centimeter, name: 'm',  display_ratio: 0.01, creator: user)
DisplayUnit.create!(standard_unit: centimeter, name: 'km', display_ratio: 0.000_01, creator: user)
DisplayUnit.create!(standard_unit: centimeter, name: 'yd', display_ratio: 0.010_936_132_983_377, creator: user)
DisplayUnit.create!(standard_unit: centimeter, name: 'ft', display_ratio: 0.032_808_398_950_131, creator: user)
DisplayUnit.create!(standard_unit: centimeter, name: 'in', display_ratio: 0.393_700_787_401_57, creator: user)
DisplayUnit.create!(standard_unit: centimeter, name: 'mi', display_ratio: 0.000_006_213_711_922_373_3, creator: user)

AttributeType.create!(standard_unit: gram, name:'重さ', creator: user)
AttributeType.create!(standard_unit: centimeter, name:'幅', creator: user)
AttributeType.create!(standard_unit: centimeter, name:'奥行', creator: user)
AttributeType.create!(standard_unit: centimeter, name:'高さ', creator: user)
