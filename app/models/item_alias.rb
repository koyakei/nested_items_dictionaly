class ItemAlias < ApplicationRecord
  belongs_to :item, optional: true
  belongs_to :creator, class_name: User
end
