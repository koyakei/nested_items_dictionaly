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

basic_japanese_counter_word = StandardUnit.new(name: "個")
basic_japanese_counter_word.save!

mb = StandardUnit.new(name: "MB")
mb.save!

litre = StandardUnit.new(name: "L")
litre.save!

area = StandardUnit.new(name: "㎡")#機種依存文字だぜ
area.save!

time = StandardUnit.new(name: "second")
time.save!
# http://www.calc-site.com/units/weight
CSV.foreach("db/seeds/csv/display_units/weight_display_units.csv") do |row|
  DisplayUnit.create!(standard_unit: gram, name: row[0], display_ratio: row[1].to_f, creator: user)
end

# http://www.calc-site.com/units/length
CSV.foreach("db/seeds/csv/display_units/length_display_units.csv") do |row|
  DisplayUnit.create!(standard_unit: metre, name: row[0], display_ratio: row[1].to_f, creator: user)
end

# 助数詞
CSV.foreach("db/seeds/csv/display_units/japanese_counter_words.csv") do |row|
  DisplayUnit.create!(standard_unit: basic_japanese_counter_word, name: row[0], display_ratio: row[1].to_f, creator: user)
end

# バイト数
CSV.foreach("db/seeds/csv/display_units/byte_units.csv") do |row|
  DisplayUnit.create!(standard_unit: basic_japanese_counter_word, name: row[0], display_ratio: eval(row[1]).to_f, creator: user)
end

# 体積・容量
CSV.foreach("db/seeds/csv/display_units/volume_units.csv") do |row|
  DisplayUnit.create(standard_unit: litre, name: row[0], display_ratio: row[1], creator: user)
end

# 面積
CSV.foreach("db/seeds/csv/display_units/area_units.csv") do |row|
  DisplayUnit.create(standard_unit: area, name: row[0], display_ratio: eval(row[1]), creator: user)
end

# 時間
CSV.foreach("db/seeds/csv/display_units/time_units.csv") do |row|
  DisplayUnit.create(standard_unit: time, name: row[0], display_ratio: eval(row[1]), creator: user)
end

AttributeType.create!(standard_unit: gram, name: "重さ", creator: user)
AttributeType.create!(standard_unit: metre, name: "幅", creator: user)
AttributeType.create!(standard_unit: metre, name: "奥行", creator: user)
AttributeType.create!(standard_unit: metre, name: "高さ", creator: user)
AttributeType.create!(standard_unit: metre, name: "サイズ", creator: user)
AttributeType.create!(standard_unit: area, name: "面積", creator: user)
AttributeType.create!(standard_unit: time, name: "時間", creator: user)

AttributeType.create!(standard_unit: basic_japanese_counter_word, name: "個数", creator: user)
AttributeType.create!(standard_unit: mb, name: "データ容量", creator: user)
AttributeType.create!(standard_unit: litre, name: "容量", creator: user)
