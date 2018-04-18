class CreateItemAdditionalConditions < ActiveRecord::Migration[5.1]
  def change
    create_table :item_additional_conditions, force: :cascade, comment: "itemこのテーブルもfallbackの対象" do |t|
      t.references :item, foreign_key: true
      t.references :additional_condition, foreign_key: true
      t.float :discount_ratio, limit: 53, null: false, default: 0
      t.integer :discount_price, null: false, default: 0
      t.references :creator, foreign_key: { to_table: :users, on_update: :cascade }, null: false, default: 0
      t.timestamps
    end
  end
end
