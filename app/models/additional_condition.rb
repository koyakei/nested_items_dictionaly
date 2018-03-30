class AdditionalCondition < ApplicationRecord
  has_many :item_additional_conditions
  belongs_to :creator, class_name: User.to_s
end
