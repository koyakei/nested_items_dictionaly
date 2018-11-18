class CreateAdminMakers < ActiveRecord::Migration[5.1]
  def change
    create_table :makers do |t|
      t.text :name, limit: 45, null: false
      t.text :remarks, limit: 100
      t.text :url, limit: 100

      t.timestamps
    end
    add_index :makers, :name, unique: true
  end
end
