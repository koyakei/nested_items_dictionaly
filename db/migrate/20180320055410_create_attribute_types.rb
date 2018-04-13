class CreateAttributeTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :attribute_types do |t|
      t.references :standard_unit, foreign_key: { on_update: :cascade }, null: false
      t.text :name, null: false
      t.references :creator, foreign_key: { to_table: :users, on_update: :cascade }, null: false, default: 0
      t.timestamps default: -> { 'NOW()' }
    end
  end
end
