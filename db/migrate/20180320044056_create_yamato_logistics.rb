class CreateYamatoLogistics < ActiveRecord::Migration[5.1]
  def change
    create_table :yamato_logistics do |t|
      # t.references :item, foreign_key: true
      t.references :yamato_size_item_code, foreign_key: true
      t.references :yamato_packing_item_code, foreign_key: true
      t.references :yamato_handling_type_code1, foreign_key: { to_table: :yamato_handling_type_codes }
      t.references :yamato_handling_type_code2, foreign_key: { to_table: :yamato_handling_type_codes }
    end
  end
end
