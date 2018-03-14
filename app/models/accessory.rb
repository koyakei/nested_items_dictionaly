class Accessory < ApplicationRecord
  belongs_to :base_item, class_name: Item
  belongs_to :accessory_item, class_name: Item
end
