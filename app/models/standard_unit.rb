class StandardUnit < ApplicationRecord
  has_many :attribute_types
  has_many :display_units
end
