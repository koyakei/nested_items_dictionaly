class Maker < ApplicationRecord
  searchkick

  has_many :maker_aliases
  belongs_to :creator, class_name: User.to_s
end
