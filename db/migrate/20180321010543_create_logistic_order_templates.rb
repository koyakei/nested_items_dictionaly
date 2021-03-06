class CreateLogisticOrderTemplates < ActiveRecord::Migration[5.1]
  def change
    create_table :logistic_order_templates do |t|
      t.references :item, foreign_key: true, null: false
      t.references :logistic_order_templatable,
                   index: {name: :index_logistic_templates_on_type_and_template},
                   null: false, polymorphic: true
      t.references :creator, foreign_key: {to_table: :users}, null: false, default: 1
      t.timestamps default: -> { 'NOW()' }
    end
  end
end
