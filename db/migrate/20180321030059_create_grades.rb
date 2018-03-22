class CreateGrades < ActiveRecord::Migration[5.1]
  def change
    create_table :grades do |t|
      t.text :name, null: false
      t.text :description

      t.timestamps default: -> { 'NOW()' }
    end
  end
end
