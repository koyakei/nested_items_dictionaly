user = User.new(id: 0)
user.save!
maker = Maker.new(id: 0, description: "unknown", name: "不明", creator: User.first!)
maker.save!
MakerAlias.new(name: :わからん, creator: User.first!, maker: maker).save!

item = Item.new(id: 0, name: "全部", maker: maker, description: "全部",
                max_threshold_price: 2_147_483_647,
                min_threshold_price: 0, creator: User.first)
item.save!(validate: false)

ItemAlias.new(name: :すべて, creator: User.first!, item: item).save!

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

yamato_logistic_order_template = LogisticOrderTemplatable::Yamato::LogisticOrderTemplate.new
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

area = StandardUnit.new(name: "㎡") # 機種依存文字だぜ
area.save!

time = StandardUnit.new(name: "second")
time.save!

hertz = StandardUnit.new(name: "Hz")
hertz.save!

transport_speed_byte = StandardUnit.new(name: "MB/s")
transport_speed_byte.save!

voltage = StandardUnit.new(name: "V")
voltage.save!

ampere = StandardUnit.new(name: "A")
ampere.save!

ohm = StandardUnit.new(name: "Ω")
ohm.save!

speed = StandardUnit.new(name: "km/h")
speed.save!

tesla = StandardUnit.new(name: "T")
tesla.save!

farad = StandardUnit.new(name: "F")
farad.save!

pascal = StandardUnit.new(name: "Pa")
pascal.save!

celsius = StandardUnit.new(name: "℃")
celsius.save!

rotational_speed = StandardUnit.new(name: "rpm")
rotational_speed.save!

decibel = StandardUnit.new(name: "dB")
decibel.save!

watt = StandardUnit.new(name: "W")
watt.save!

watt_hour = StandardUnit.new(name: "W/h")
watt_hour.save!

lux = StandardUnit.new(name: "lx")
lux.save!

candela = StandardUnit.new(name: "cd")
candela.save!

# http://www.calc-site.com/units/weight
CSV.foreach("db/seeds/csv/display_units/weight.csv") do |row|
  DisplayUnit.create!(standard_unit: gram, name: row[0], display_ratio: row[1].to_f, creator: user)
end

# http://www.calc-site.com/units/length
CSV.foreach("db/seeds/csv/display_units/length.csv") do |row|
  DisplayUnit.create!(standard_unit: metre, name: row[0], display_ratio: row[1].to_f, creator: user)
end

# 助数詞
CSV.foreach("db/seeds/csv/display_units/japanese_counter_words.csv") do |row|
  DisplayUnit.create!(standard_unit: basic_japanese_counter_word, name: row[0], display_ratio: 1, creator: user)
end

# バイト数
CSV.foreach("db/seeds/csv/display_units/byte.csv") do |row|
  DisplayUnit.create!(standard_unit: basic_japanese_counter_word, name: row[0], display_ratio: eval(row[1]).to_f, creator: user)
end

# 体積・容量
CSV.foreach("db/seeds/csv/display_units/volume.csv") do |row|
  DisplayUnit.create(standard_unit: litre, name: row[0], display_ratio: row[1], creator: user)
end

# 面積
CSV.foreach("db/seeds/csv/display_units/area.csv") do |row|
  DisplayUnit.create(standard_unit: area, name: row[0], display_ratio: eval(row[1]), creator: user)
end

# 時間
CSV.foreach("db/seeds/csv/display_units/time.csv") do |row|
  DisplayUnit.create(standard_unit: time, name: row[0], display_ratio: eval(row[1]), creator: user)
end

#
CSV.foreach("db/seeds/csv/display_units/hertz.csv") do |row|
  DisplayUnit.create(standard_unit: hertz, name: row[0], display_ratio: eval(row[1]), creator: user)
end

#
CSV.foreach("db/seeds/csv/display_units/transport_speed_byte.csv") do |row|
  DisplayUnit.create(standard_unit: transport_speed_byte, name: row[0], display_ratio: eval(row[1]), creator: user)
end

CSV.foreach("db/seeds/csv/display_units/voltage.csv") do |row|
  DisplayUnit.create(standard_unit: voltage, name: row[0], display_ratio: eval(row[1]), creator: user)
end

CSV.foreach("db/seeds/csv/display_units/ampere.csv") do |row|
  DisplayUnit.create(standard_unit: ampere, name: row[0], display_ratio: eval(row[1]), creator: user)
end

CSV.foreach("db/seeds/csv/display_units/ohm.csv") do |row|
  DisplayUnit.create(standard_unit: ohm, name: row[0], display_ratio: eval(row[1]), creator: user)
end

CSV.foreach("db/seeds/csv/display_units/speed.csv") do |row|
  DisplayUnit.create(standard_unit: speed, name: row[0], display_ratio: eval(row[1]), creator: user)
end

CSV.foreach("db/seeds/csv/display_units/tesla.csv") do |row|
  DisplayUnit.create(standard_unit: tesla, name: row[0], display_ratio: eval(row[1]), creator: user)
end

CSV.foreach("db/seeds/csv/display_units/farad.csv") do |row|
  DisplayUnit.create(standard_unit: farad, name: row[0], display_ratio: eval(row[1]), creator: user)
end

CSV.foreach("db/seeds/csv/display_units/pascal.csv") do |row|
  DisplayUnit.create(standard_unit: pascal, name: row[0], display_ratio: eval(row[1]), creator: user)
end

CSV.foreach("db/seeds/csv/display_units/celsius.csv") do |row|
  DisplayUnit.create(standard_unit: celsius, name: row[0], display_ratio: eval(row[1]), creator: user)
end

CSV.foreach("db/seeds/csv/display_units/rotational_speed.csv") do |row|
  DisplayUnit.create(standard_unit: rotational_speed, name: row[0], display_ratio: eval(row[1]), creator: user)
end

CSV.foreach("db/seeds/csv/display_units/decibel.csv") do |row|
  DisplayUnit.create(standard_unit: decibel, name: row[0], display_ratio: eval(row[1]), creator: user)
end

CSV.foreach("db/seeds/csv/display_units/watt.csv") do |row|
  DisplayUnit.create(standard_unit: watt, name: row[0], display_ratio: eval(row[1]), creator: user)
end

CSV.foreach("db/seeds/csv/display_units/watt_hour.csv") do |row|
  DisplayUnit.create(standard_unit: watt_hour, name: row[0], display_ratio: eval(row[1]), creator: user)
end

CSV.foreach("db/seeds/csv/display_units/lux.csv") do |row|
  DisplayUnit.create(standard_unit: lux, name: row[0], display_ratio: eval(row[1]), creator: user)
end

AttributeType.create!(standard_unit: gram, name: "重さ", creator: user)
AttributeType.create!(standard_unit: metre, name: "幅", creator: user)
AttributeType.create!(standard_unit: metre, name: "奥行", creator: user)
AttributeType.create!(standard_unit: metre, name: "高さ", creator: user)
AttributeType.create!(standard_unit: metre, name: "サイズ", creator: user)
AttributeType.create!(standard_unit: area, name: "面積", creator: user)
AttributeType.create!(standard_unit: time, name: "時間", creator: user)
AttributeType.create!(standard_unit: hertz, name: "周波数", creator: user)
AttributeType.create!(standard_unit: transport_speed_byte, name: "転送速度", creator: user)
AttributeType.create!(standard_unit: voltage, name: "電圧", creator: user)
AttributeType.create!(standard_unit: ampere, name: "電流", creator: user)
AttributeType.create!(standard_unit: ohm, name: "電気抵抗", creator: user)
AttributeType.create!(standard_unit: speed, name: "速度", creator: user)
AttributeType.create!(standard_unit: farad, name: "静電容量", creator: user)
AttributeType.create!(standard_unit: tesla, name: "磁力", creator: user)
AttributeType.create!(standard_unit: pascal, name: "Pa", creator: user)
AttributeType.create!(standard_unit: celsius, name: "℃", creator: user)
AttributeType.create!(standard_unit: rotational_speed, name: "rpm", creator: user)
AttributeType.create!(standard_unit: decibel, name: "dB", creator: user)
AttributeType.create!(standard_unit: watt, name: "ワット", creator: user)
AttributeType.create!(standard_unit: watt_hour, name: "ワット時", creator: user)
AttributeType.create!(standard_unit: lux, name: "ルクス", creator: user)
AttributeType.create!(standard_unit: candela, name: "カンデラ", creator: user)

AttributeType.create!(standard_unit: basic_japanese_counter_word, name: "個数", creator: user)
AttributeType.create!(standard_unit: mb, name: "データ容量", creator: user)
AttributeType.create!(standard_unit: litre, name: "容量", creator: user)

puts "\n== Create Elasticsearch indexes =="
Rake::Task["elasticsearch:reindex"].invoke