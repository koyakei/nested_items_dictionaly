class Accessory < ApplicationRecord
  belongs_to :base_item, class_name: Item
end
