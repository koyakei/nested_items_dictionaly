class Accessory < ApplicationRecord
  belongs_to :base_item, class_name: Item.to_s
  belongs_to :accessory_item, class_name: Item.to_s
  belongs_to :creator, class_name: User.to_s
end
