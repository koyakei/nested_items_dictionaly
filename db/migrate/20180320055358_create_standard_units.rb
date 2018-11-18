class CreateStandardUnits < ActiveRecord::Migration[5.1]
  def change
    create_table :standard_units do |t|
      t.text :name, limit: 5, null: false
      t.references :creator, foreign_key: {to_table: :users}, null: false, default: 0
    end
    add_index :standard_units, :name, unique: true
  end
end
