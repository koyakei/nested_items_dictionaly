class Item < ActiveRecord::Migration[5.1]
  def change
    add_reference :items, :parent_item, index: true, foreign_key: { to_table: :items }
    add_reference :items, :item_alias, index: true, foreign_key: true, null: false
  end
end
