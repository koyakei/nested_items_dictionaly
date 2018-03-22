class CreateAdditionalConditions < ActiveRecord::Migration[5.1]
  def change
    create_table :additional_conditions do |t|
      t.text :name, null: false

      t.timestamps default: -> { 'NOW()' }
    end
  end
end
