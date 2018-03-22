class CreateMakers < ActiveRecord::Migration[5.1]
  def change
    create_table :makers do |t|
      t.text :description, limit: 100
      t.text :url, limit: 100

      t.timestamps default: -> { 'NOW()' }
    end
  end
end
