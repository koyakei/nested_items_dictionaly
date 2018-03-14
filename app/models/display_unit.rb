class DisplayUnit < ApplicationRecord
  belongs_to :standard_unit
  has_many :item_attributes
end
