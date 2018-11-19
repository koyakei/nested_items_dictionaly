class ItemAttributeType < ApplicationRecord=
  belongs_to :item
  belongs_to :attribute_type
  belongs_to :display_unit
  belongs_to :creator, class_name: User.to_s
  after_commit :reindex_item
  def reindex_item
    item.reindex_descendant
  end
end
