class ItemImage < ApplicationRecord
  belongs_to :item
  # has_one_attached :image
  belongs_to :creator, class_name: User.to_s
end
