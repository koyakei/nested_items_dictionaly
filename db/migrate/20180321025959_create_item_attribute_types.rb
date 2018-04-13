class CreateItemAttributeTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :item_attribute_types do |t|
      t.references :item, foreign_key:  { on_update: :cascade }, null: false
      t.references :attribute_type, foreign_key:  { on_update: :cascade }, null: false
      t.references :display_unit, foreign_key:  { on_update: :cascade }, null: false
      t.float :value, limit: 53, null: false
      t.references :creator, foreign_key: { to_table: :users, on_update: :cascade }, null: false, default: 0
      t.timestamps default: -> { 'NOW()' }
    end
    add_index :item_attribute_types, [:item_id, :attribute_type_id], unique: true
  end
end
