# User.new(id: 1).save
maker = Maker.new(id: 1, description: 'unknown')
maker.save!
maker_alias = MakerAlias.new(name: '不明')
maker_alias.maker = Maker.first
maker_alias.save
maker.name = maker_alias.name
maker.save
item_alias = ItemAlias.new
item_alias.name = 'ALL'
item_alias.creator = User.first
item_alias.save!

item = Item.new(id: 1)
item.maker_id = 1
item.creator_id = 1
item.name = item_alias.name

item.max_threshold_price = 2_147_483_647
item.min_threshold_price = 0
item.save!(validate: false)
CSV.foreach('db/seeds/csv/yamato_packing_item_codes.csv') do |row|
  YamatoPackingItemCode.new(code: row[0], name: row[1]).save
end

CSV.foreach('db/seeds/csv/yamato_size_item_codes.csv') do |row|
  YamatoSizeItemCode.new(code_from: row[0], name_from: row[1],
                         code_to: row[2], name_to: row[3], size: row[4]).save
end

CSV.foreach('db/seeds/csv/yamato_handling_type_codes.csv') do |row|
  YamatoHandlingTypeCode.new(code: row[0], name: row[1]).save
end

yamato_logistic_order_template = YamatoLogisticOrderTemplate.new
yamato_logistic_order_template.yamato_size_item_code = YamatoSizeItemCode.first
yamato_logistic_order_template.yamato_packing_item_code = YamatoPackingItemCode.first
yamato_logistic_order_template.yamato_handling_type_code = YamatoHandlingTypeCode.first
yamato_logistic_order_template.save

logistic_order_template = LogisticOrderTemplate.new
logistic_order_template.item = Item.first
logistic_order_template.logistic_order_templatable = YamatoLogisticOrderTemplate.first
logistic_order_template.save!
