class ItemAttributeType < ApplicationRecord
  belongs_to :item
  belongs_to :attribute_type
  belongs_to :display_unit
end
