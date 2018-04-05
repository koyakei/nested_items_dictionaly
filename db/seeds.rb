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

metre = StandardUnit.new(name: "m")
metre.save!

count = StandardUnit.new(name: "個")
count.save!

mb = StandardUnit.new(name: "MB")
mb.save!

litre = StandardUnit.new(name: "L")
litre.save!

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
DisplayUnit.create!(standard_unit: metre, name: 'μm', display_ratio: 1_000_000, creator: user)
DisplayUnit.create!(standard_unit: metre, name: 'mm', display_ratio: 1_000, creator: user)
DisplayUnit.create!(standard_unit: metre, name: 'cm', display_ratio: 100, creator: user)
DisplayUnit.create!(standard_unit: metre, name: 'm',  display_ratio: 1, creator: user)
DisplayUnit.create!(standard_unit: metre, name: 'km', display_ratio: 0.001, creator: user)
DisplayUnit.create!(standard_unit: metre, name: 'yd', display_ratio: 1.093_613_298_337_7, creator: user)
DisplayUnit.create!(standard_unit: metre, name: 'ft', display_ratio: 3.280_839_895_013_1, creator: user)
DisplayUnit.create!(standard_unit: metre, name: 'in', display_ratio: 39.370_078_740_157, creator: user)
DisplayUnit.create!(standard_unit: metre, name: 'mi', display_ratio: 0.000_621_371_192_237_33, creator: user)

# 個数
DisplayUnit.create!(standard_unit: count, name: '個', display_ratio: 1, creator: user)
DisplayUnit.create!(standard_unit: count, name: '台', display_ratio: 1, creator: user)

# バイト数
DisplayUnit.create!(standard_unit: mb, name: 'B',  display_ratio: 1024 * 1024, creator: user)
DisplayUnit.create!(standard_unit: mb, name: 'KB', display_ratio: 1024, creator: user)
DisplayUnit.create!(standard_unit: mb, name: 'MB', display_ratio: 1, creator: user)
DisplayUnit.create!(standard_unit: mb, name: 'GB', display_ratio: 1 / 1024, creator: user)
DisplayUnit.create!(standard_unit: mb, name: 'TB', display_ratio: 1 / 1024 / 1024, creator: user)
DisplayUnit.create!(standard_unit: mb, name: 'PB', display_ratio: 1 / 1024 / 1024 / 1024, creator: user)
DisplayUnit.create!(standard_unit: mb, name: 'EB', display_ratio: 1 / 1024 / 1024 / 1024 / 1024, creator: user)

# 体積・容量
DisplayUnit.create(standard_unit: litre, name: 'mL', display_ratio: 1000, creator: user)
DisplayUnit.create(standard_unit: litre, name: 'cc', display_ratio: 1000, creator: user)
DisplayUnit.create(standard_unit: litre, name: 'cL', display_ratio: 100, creator: user)
DisplayUnit.create(standard_unit: litre, name: 'dL', display_ratio: 10, creator: user)
DisplayUnit.create(standard_unit: litre, name: 'L',  display_ratio: 1, creator: user)
DisplayUnit.create(standard_unit: litre, name: 'gal', display_ratio: 0.264172037284185, creator: user)
DisplayUnit.create(standard_unit: litre, name: 'bu',  display_ratio: 0.028377593258402, creator: user)
DisplayUnit.create(standard_unit: litre, name: 'fl oz',  display_ratio: 0.033814022701843, creator: user)
DisplayUnit.create(standard_unit: litre, name: 'gi',  display_ratio: 8.4535056754607, creator: user)
DisplayUnit.create(standard_unit: litre, name: 'pt',  display_ratio: 2.1133764188652, creator: user)
DisplayUnit.create(standard_unit: litre, name: 'qt',  display_ratio: 1.0566882094326, creator: user)
DisplayUnit.create(standard_unit: litre, name: 'bl',  display_ratio: 0.0083864143605761, creator: user)
DisplayUnit.create(standard_unit: litre, name: '合',  display_ratio: 5.5435235318617, creator: user)
DisplayUnit.create(standard_unit: litre, name: '升',  display_ratio: 0.55435235318617, creator: user)

AttributeType.create!(standard_unit: gram, name:'重さ', creator: user)
AttributeType.create!(standard_unit: metre, name:'幅', creator: user)
AttributeType.create!(standard_unit: metre, name:'奥行', creator: user)
AttributeType.create!(standard_unit: metre, name:'高さ', creator: user)
AttributeType.create!(standard_unit: metre, name:'サイズ', creator: user)

AttributeType.create!(standard_unit: count, name:'個数', creator: user)
AttributeType.create!(standard_unit: mb, name:'データ容量', creator: user)
AttributeType.create!(standard_unit: litre, name:'容量', creator: user)
