class DisplayUnit < ApplicationRecord
  belongs_to :standard_unit
  has_many :item_attribute_types
  belongs_to :creator, class_name: User.to_s
end
