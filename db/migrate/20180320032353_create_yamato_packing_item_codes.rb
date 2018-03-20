class CreateYamatoPackingItemCodes < ActiveRecord::Migration[5.1]
  def change
    create_table :yamato_packing_item_codes do |t|
      t.text :code, limit: 3
      t.text :name, limit: 30
    end
    add_index :yamato_packing_item_codes, :code, unique: true
  end
end
