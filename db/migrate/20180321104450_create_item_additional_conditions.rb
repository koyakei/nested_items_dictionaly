class CreateItemAdditionalConditions < ActiveRecord::Migration[5.1]
  def change
    create_table :item_additional_conditions do |t|
      t.references :item, foreign_key: true
      t.references :additional_condition, foreign_key: true
      t.float :discount_ratio, limit: 53
      t.references :creator, foreign_key: {to_table: :users}, null: false, default: 0
      t.timestamps
    end
  end
end
