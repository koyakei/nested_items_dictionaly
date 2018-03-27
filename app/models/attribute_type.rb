class AttributeType < ApplicationRecord
  belongs_to :standard_unit
  has_many :item_attribute_types
end
