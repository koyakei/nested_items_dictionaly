class ItemAdditionalCondition < ApplicationRecord
  belongs_to :item
  belongs_to :additional_condition
  belongs_to :creator, class_name: User.to_s
end
