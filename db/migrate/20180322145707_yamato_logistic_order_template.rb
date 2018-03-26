class YamatoLogisticOrderTemplate < ActiveRecord::Migration[5.1]
  def change
    add_reference :yamato_logistic_order_templates, :creator, index: true, null: false, default: 1
    add_foreign_key :yamato_logistic_order_templates, :users, column: :creator_id
  end
end
