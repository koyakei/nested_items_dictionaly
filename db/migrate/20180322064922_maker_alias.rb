class MakerAlias < ActiveRecord::Migration[5.1]
  def change
    add_reference :maker_aliases, :creator, index: true, null: false, default: 1
    add_foreign_key :maker_aliases, :users, column: :creator_id
  end
end
