class CreateItemGradesDiscounts < ActiveRecord::Migration[5.1]
  def change
    create_table :item_grades_discounts do |t|
      t.references :item, foreign_key: { on_update: :cascade }, null: false
      t.references :grade, foreign_key: { on_update: :cascade }, null: false
      t.references :creator, foreign_key: { to_table: :users, on_update: :cascade }, null: false, default: 0
      t.float :discount_ration, limit: 53, null: false

      t.timestamps default: -> { 'NOW()' }
    end
  end
end
