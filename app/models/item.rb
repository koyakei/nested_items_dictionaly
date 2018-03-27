class Item < ApplicationRecord
  belongs_to :creator, class_name: User
  belongs_to :maker
  has_many :item_aliases
  has_many :costs_for_items
  has_many :logistic_order_templates
  has_many :accessory_types
  has_many :item_images
end