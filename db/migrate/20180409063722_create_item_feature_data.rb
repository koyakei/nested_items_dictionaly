class CreateItemFeatureData < ActiveRecord::Migration[5.2]
  def change
    create_table :item_feature_data, force: :cascade do |t|
      t.references :item, foreign_key: { on_update: :cascade }
      t.integer :number
      t.text :feature

      t.timestamps default: -> { "NOW()" }
    end
    add_index :item_feature_data, [:item_id, :number], unique: true
  end
end
