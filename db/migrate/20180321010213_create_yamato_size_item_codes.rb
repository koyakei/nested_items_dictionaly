class CreateYamatoSizeItemCodes < ActiveRecord::Migration[5.1]
  def change
    create_table :yamato_size_item_codes do |t|
      t.text :code_from, limit: 4, null: false
      t.text :name_from, limit: 30, null: false
      t.text :code_to, limit: 4, null: false
      t.text :name_to, limit: 30, null: false
      t.text :size, limit:3, null: false
    end
    add_index :yamato_size_item_codes, :code_from, unique: true
    add_index :yamato_size_item_codes, :code_to, unique: true
    add_index :yamato_size_item_codes, :size, unique: true
  end
end
