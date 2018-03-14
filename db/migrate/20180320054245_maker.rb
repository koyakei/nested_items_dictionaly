class Maker < ActiveRecord::Migration[5.1]
  def change
	  add_reference :makers, :maker_alias, uniq: true
	  add_foreign_key :makers, :maker_aliases
  end
end
