class ItemGradesDiscount < ApplicationRecord
  belongs_to :item
  belongs_to :grade
  belongs_to :user
end
