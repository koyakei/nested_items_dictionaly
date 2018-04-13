class CreateTagOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_orders do |t|
      t.text :name, limit: 20, null: false
      t.references :tag_order_type, null: false, foreign_key: true
      t.references :creator, foreign_key: { to_table: :users, on_update: :cascade }, null: false, default: 0
      t.integer :order, null: false

      t.timestamps default: -> { "NOW()" }
    end
    add_index :tag_orders, [:tag_order_type_id, :name], unique: true
  end
end
