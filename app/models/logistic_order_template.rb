class LogisticOrderTemplate < ApplicationRecord
  belongs_to :item
  belongs_to :logistic_order_templatable, polymorphic: true
  belongs_to :creator, class_name: User.to_s
end
