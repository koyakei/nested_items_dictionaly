class CreateAdminYamatoHandlingTypeCodes < ActiveRecord::Migration[5.1]
  def change
    create_table :yamato_handling_type_codes do |t|
      t.text :code, limit: 1
      t.text :name, limit: 10
    end
    add_index :yamato_handling_type_codes, :code, unique: true
  end
end
