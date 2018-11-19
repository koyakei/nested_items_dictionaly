class Maker < ApplicationRecord
  has_many :items
  has_many :maker_aliases
  belongs_to :creator, class_name: User.to_s

  after_commit :reindex_items

  def search_data
    {
      description: description,
      url: url,
      name: name,
      creator_id: creator_id,
      created_at: created_at,
      updated_at: updated_at,
      maker_aliases: maker_aliases&.map(&:name)
    }
  end

  def reindex_items
    items.map {
      |item| item.reindex
    }
  end
end
