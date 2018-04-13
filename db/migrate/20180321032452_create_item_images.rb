class CreateItemImages < ActiveRecord::Migration[5.1]
  def change
    create_table :item_images do |t|
      t.references :item, foreign_key: { on_update: :cascade }, null: false
      t.text :url
      t.text :name
      t.text :description
      t.references :creator, foreign_key: { to_table: :users, on_update: :cascade }, null: false, default: 0
      t.timestamps default: -> { "NOW()" }
    end
  end
end
