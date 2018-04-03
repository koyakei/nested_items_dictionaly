class AddColumnItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :is_sync_novasto, :boolean, default: false, null: false
    add_column :items, :amazon_category_id, :bigint
    add_index :items, :isbn13
    add_index :items, :asin
    add_index :items, :amazon_category_id
  end
end
