class CreateYamatoPackingItemCodes < ActiveRecord::Migration[5.1]
  def change
    create_table :yamato_packing_item_codes do |t|
      t.text :code, limit: 3, null: false
      t.text :name, limit: 30, null: false
      t.references :item, foreign_key: true
    end
    add_index :yamato_packing_item_codes, :code, unique: true
  end
end
