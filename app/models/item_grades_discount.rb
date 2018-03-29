class ItemGradesDiscount < ApplicationRecord
  belongs_to :item
  belongs_to :grade
  belongs_to :creator, class_name: User.to_s
end
