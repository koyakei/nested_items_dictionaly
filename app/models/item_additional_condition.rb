class ItemAdditionalCondition < ApplicationRecord
  belongs_to :item
  belongs_to :additional_condition
end
