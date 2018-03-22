class CreateAttributes < ActiveRecord::Migration[5.1]
  def change
    create_table :attributes do |t|
      t.references :standard_unit, foreign_key: true, null: false
      t.text :name, null: false

      t.timestamps default: -> { 'NOW()' }
    end
  end
end
