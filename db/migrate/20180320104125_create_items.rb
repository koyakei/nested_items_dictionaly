class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.integer :max_threshold_price
      t.integer :min_threshold_price, default: 0
      t.text :description
      t.text :name, null:false
      t.integer :prospected_price
      t.boolean :has_child, null: false, default: true
      t.boolean :is_visible, null: false, default: true, null: false, default: true
      t.references :maker, foreign_key: true, null: false, default: 1
      t.text :maker_model_number_full
      t.text :maker_model_number
      t.text :asin_isbn13, limit: 15
      t.text :ean, limit: 15
      t.text :url
      t.integer :automatic_assessment_type, limit: 1
      t.references :creator, foreign_key: {to_table: :users}, null: false, default: 1

      t.timestamps default: -> { 'NOW()' }
    end
  end
end
