class CreateStandardUnits < ActiveRecord::Migration[5.1]
  def change
    create_table :standard_units do |t|
      t.text :name, limit: 5, null: false
    end
    add_index :standard_units, :name, unique: true
  end
end
