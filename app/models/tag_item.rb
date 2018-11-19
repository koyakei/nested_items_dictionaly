class TagItem < ApplicationRecord
  belongs_to :item
  belongs_to :tag
  belongs_to :creator, class_name: User.to_s
end
