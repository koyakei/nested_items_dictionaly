class TagOrder < ApplicationRecord
  belongs_to :creator, class_name: User.to_s
  belongs_to :tag_order_type
end
