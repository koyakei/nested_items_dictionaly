class AddAmazonUniqueIndex < ActiveRecord::Migration[5.2]
  def change
    remove_index :items, :amazon_category_id
    add_index :items, :amazon_category_id, unique: true
  end
end
