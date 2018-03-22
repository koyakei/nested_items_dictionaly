class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.text :cognito_id

      t.timestamps default: -> { 'NOW()' }
    end
    add_index :users, :cognito_id, unique: true
  end
end
