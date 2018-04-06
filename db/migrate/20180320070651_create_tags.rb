class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.text :name, limit: 20, null: false
      t.text :description
      t.references :creator, foreign_key: { to_table: :users }, null: false, default: 0

      t.timestamps default: -> { "NOW()" }
    end
    add_index :tags, :name, unique: true
  end
end
