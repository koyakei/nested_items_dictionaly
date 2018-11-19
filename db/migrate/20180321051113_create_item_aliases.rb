class CreateItemAliases < ActiveRecord::Migration[5.1]
  def change
    create_table :item_aliases, force: :cascade do |t|
      t.references :item, foreign_key: true
      t.text :name
      t.references :creator, foreign_key: { to_table: :users, on_update: :cascade }, null: false, default: 0

      t.timestamps default: -> { "NOW()" }
    end
  end
end
