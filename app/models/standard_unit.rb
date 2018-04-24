class StandardUnit < ApplicationRecord
  searchkick
  has_many :attribute_types
  has_many :display_units
  belongs_to :creator, class_name: User.to_s
  has_many :item_attribute_types, through: :attribute_type
end