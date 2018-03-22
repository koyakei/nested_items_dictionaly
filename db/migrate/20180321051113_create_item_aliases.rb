class CreateItemAliases < ActiveRecord::Migration[5.1]
  def change
    create_table :item_aliases do |t|
      t.references :item, foreign_key: true
      t.text :name
      t.references :creator, foreign_key: { to_table: :users }, null: false

      t.timestamps default: -> { 'NOW()' }
    end
  end
end
