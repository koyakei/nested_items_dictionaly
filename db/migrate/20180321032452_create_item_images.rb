class CreateItemImages < ActiveRecord::Migration[5.1]
  def change
    create_table :item_images do |t|
      t.references :item, foreign_key: true, null: false
      t.text :image_path, null: false
      t.text :name
      t.text :description
      t.references :creator, foreign_key: {to_table: :users}, null: false, default: 1
      t.timestamps default: -> { 'NOW()' }
    end
  end
end
