class CreateMakers < ActiveRecord::Migration[5.1]
  def change
    create_table :makers do |t|
      t.text :description, limit: 100
      t.text :url, limit: 100
      t.text :name, null: false
      t.references :creator, foreign_key: {to_table: :users}, null: false, default: 0
      t.timestamps default: -> { 'NOW()' }
    end
  end
end
