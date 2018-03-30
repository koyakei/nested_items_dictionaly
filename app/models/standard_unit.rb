class StandardUnit < ApplicationRecord
  has_many :attribute_type
  has_many :display_units
  belongs_to :creator, class_name: User.to_s
end
