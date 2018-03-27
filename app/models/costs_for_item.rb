class CostsForItem < ApplicationRecord
  belongs_to :creator, class_name: User
  belongs_to :item
end
