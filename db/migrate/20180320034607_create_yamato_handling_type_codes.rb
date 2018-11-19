class CreateYamatoHandlingTypeCodes < ActiveRecord::Migration[5.1]
  def change
    create_table :yamato_handling_type_codes, force: :cascade do |t|
      t.text :code, limit: 2, null: false
      t.text :name, limit: 10, null: false
    end
    add_index :yamato_handling_type_codes, :code, unique: true
  end
end
