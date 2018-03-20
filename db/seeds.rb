# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
CSV.foreach('db/seeds/csv/yamato_packing_item_codes.csv') do |row|
	YamatoPackingItemCode.new.save(code: row[0], name: row[1])
end

CSV.foreach('db/seeds/csv/yamato_size_item_codes.csv') do |row|
	YamatoSizeItemCode.new.save(code: row[0], name: row[1])
end

CSV.foreach('db/seeds/csv/yamato_handling_type_codes.csv') do |row|
	YamatoHandlingTypeCode.new.save(code: row[0], name: row[1])
end

YamatoLogistic.new.save(yamato_size_item_code: 1, yamato_packing_item_code: 1, yamato_handling_type_codeable: 1)

# CSV.foreach('db/seeds/csv/makers.csv') do |row|
# 	aliases = []
# 	row.from(3).each do |name|
# 		aliases << MakerAlias.new(name: name)
# 	end
# 	Maker.new(name: row[0], remarks: row[1],
# 	                         url: row[2],
# 	                         maker_aliases: aliases).save
# end