class CreateTagItems < ActiveRecord::Migration[5.1]
  def change
    create_table :tag_items do |t|
      t.references :tag, foreign_key: true, null: false
      t.references :item, foreign_key: true, null: false
      t.references :creator, foreign_key: { to_table: :users }, null: false, default: 1

      t.timestamps default: -> { 'NOW()' }
    end
  end
end
