class CreateCostsForItems < ActiveRecord::Migration[5.1]
  def change
    create_table :costs_for_items do |t|
      t.references :creator, foreign_key: {to_table: :users}, null: false, default: 0
      t.references :item, foreign_key: true, null: false
      t.float :cost_ratio, limit: 53
      t.integer :selling_cost
      t.integer :freight_cost_in
      t.integer :freight_cost_out
      t.integer :storage_cost, comment: '倉庫内の移動コストが大半なので、１日ごとのコストでは計算しない'

      t.timestamps default: -> { 'NOW()' }
    end
  end
end
