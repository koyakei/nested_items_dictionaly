class CreateYamatoPackingItemCodes < ActiveRecord::Migration[5.1]
  def change
    create_table :yamato_packing_item_codes, force: :cascade do |t|
      t.text :code, limit: 3, null: false
      t.text :name, limit: 30, null: false
      t.references :item, foreign_key: { on_update: :cascade }
    end
    add_index :yamato_packing_item_codes, :code, unique: true
  end
end
