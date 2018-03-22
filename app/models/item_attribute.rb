class ItemAttribute < ApplicationRecord
  belongs_to :item
  belongs_to :attribute
  belongs_to :display_unit
end
