class CreateAdminMakerAliases < ActiveRecord::Migration[5.1]
  def change
    create_table :maker_aliases do |t|
      t.references :maker, foreign_key: true
      t.text :name, limit: 45, null: false

      t.timestamps
    end
  end
end
