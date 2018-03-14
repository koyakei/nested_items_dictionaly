class StandardUnit < ApplicationRecord
  has_many :attributes
  has_many :display_units
end
