class CreateAdminYamatoSizeItemCodes < ActiveRecord::Migration[5.1]
  def change
    create_table :yamato_size_item_codes do |t|
      t.text :code, limit: 4
      t.text :name, limit: 30
    end
    add_index :yamato_size_item_codes, :code, unique: true
  end
end
