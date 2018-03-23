class CreateItemImages < ActiveRecord::Migration[5.1]
  def change
    create_table :item_images do |t|
      t.references :item, foreign_key: true, null: false
      t.text :name
      t.text :description

      t.timestamps default: -> { "NOW()" }
    end
  end
end
