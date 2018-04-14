class Maker < ApplicationRecord
  searchkick
  has_many :items
  has_many :maker_aliases
  belongs_to :creator, class_name: User.to_s

  after_commit :reindex_items

  def reindex_items
    items.map {
      |item| item.reindex
    }
  end
end
