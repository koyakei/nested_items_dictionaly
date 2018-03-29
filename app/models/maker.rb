class Maker < ApplicationRecord
  has_many :maker_aliases
  # belongs_to :creator, class_name: User
end
