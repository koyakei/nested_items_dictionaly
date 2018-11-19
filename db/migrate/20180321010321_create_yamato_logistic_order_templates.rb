class CreateYamatoLogisticOrderTemplates < ActiveRecord::Migration[5.1]
  def change
    create_table :yamato_logistic_order_templates, force: :cascade do |t|
      t.references :yamato_size_item_code, foreign_key:  { on_update: :cascade }, index: { name: :index_yamato_templates_on_yamato_item_code_id }
      t.references :yamato_packing_item_code, foreign_key:  { on_update: :cascade }, index: { name: :index_yamato_templates_on_yamato_packing_code_id }
      t.references :yamato_handling_type_code1, foreign_key: { to_table: :yamato_handling_type_codes }, index: { name: :index_yamato_templates_on_yamato_handling_code1_id }
      t.references :yamato_handling_type_code2, foreign_key: { to_table: :yamato_handling_type_codes }, index: { name: :index_yamato_templates_on_yamato_handling_code2_id }
      t.references :creator, foreign_key: { to_table: :users, on_update: :cascade }, null: false, default: 0
      t.timestamps default: -> { "NOW()" }
    end
  end
end
