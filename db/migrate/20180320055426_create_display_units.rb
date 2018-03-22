class CreateDisplayUnits < ActiveRecord::Migration[5.1]
  def change
    create_table :display_units do |t|
      t.references :standard_unit, foreign_key: true, null: false
      t.text :name, limit: 5, null: false
      t.float :display_ratio, limit:53, null: false

      t.timestamps default: -> { 'NOW()' }
    end
    add_index :display_units, :name, unique: true
  end
end
