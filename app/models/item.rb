class Item < ApplicationRecord
  has_many :children_items, class_name: Item.to_s, foreign_key: :parent_item_id
  belongs_to :creator, class_name: User.to_s
  belongs_to :maker
  has_many :item_aliases
  belongs_to :item_alias
  belongs_to :parent_item, class_name: Item.to_s, optional: false
  has_many :costs_for_items
  has_many :logistic_order_templates
  has_many :accessories
  has_many :item_images
end