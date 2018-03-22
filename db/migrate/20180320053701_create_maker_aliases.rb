class CreateMakerAliases < ActiveRecord::Migration[5.1]
  def change
    create_table :maker_aliases do |t|
      t.references :maker, foreign_key: true, null: false
      t.text :name, limit: 45, null: false

      t.timestamps default: -> { 'NOW()' }
    end
  end
end
