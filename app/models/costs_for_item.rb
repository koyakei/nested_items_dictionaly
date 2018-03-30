class CostsForItem < ApplicationRecord
  belongs_to :creator, class_name: User.to_s
  belongs_to :item
end
