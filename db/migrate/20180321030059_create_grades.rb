class CreateGrades < ActiveRecord::Migration[5.1]
  def change
    create_table :grades do |t|
      t.text :name, null: false
      t.text :description
      t.references :creator, foreign_key: {to_table: :users}, null: false, default: 1
      t.timestamps default: -> { 'NOW()' }
    end
  end
end
