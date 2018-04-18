class CreateTagOrderTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_order_types, force: :cascade do |t|
      t.text :name, limit: 20, null: false
      t.references :creator, foreign_key: { to_table: :users, on_update: :cascade }, null: false, default: 0
      t.text :description, limit: 200

      t.timestamps default: -> { "NOW()" }
    end
    add_index :tag_order_types, [:creator_id, :name], unique: true
  end
end
