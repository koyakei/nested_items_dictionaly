class CreateAccessories < ActiveRecord::Migration[5.1]
  def change
    create_table :accessories do |t|
      t.references :base_item, foreign_key: { to_table: :items }, null: false
      t.references :accessory_item, foreign_key: { to_table: :items }, null: false
      t.references :creator, foreign_key: { to_table: :users, on_update: :cascade }, null: false, default: 0
      t.timestamps default: -> { 'NOW()' }
    end
  end
end
