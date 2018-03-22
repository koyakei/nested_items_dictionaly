class CreateItemAttributes < ActiveRecord::Migration[5.1]
  def change
    create_table :item_attributes do |t|
      t.references :item, foreign_key: true, null: false
      t.references :attribute, foreign_key: true, null: false
      t.references :display_unit, foreign_key: true, null: false
      t.float :value, limit: 53, null: false

      t.timestamps default: -> { 'NOW()' }
    end
  end
end
