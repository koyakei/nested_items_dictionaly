class CreateAdminStandardUnits < ActiveRecord::Migration[5.1]
  def change
    create_table :standard_units do |t|
      t.text :unit, limit: 5, null: false
    end
    add_index :standard_units, :unit, unique: true
  end
end