class CreateAdditionalConditions < ActiveRecord::Migration[5.1]
  def change
    create_table :additional_conditions do |t|
      t.text :name, null: false
      t.references :creator, foreign_key: { to_table: :users }, null: false, default: 0
      t.timestamps default: -> { "NOW()" }
    end
  end
end
