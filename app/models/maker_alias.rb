class MakerAlias < ApplicationRecord
  belongs_to :maker
  belongs_to :creator, class_name: User.to_s, foreign_key: :creator_id
  has_many :items, through: :maker

  after_commit :reindex_maker
  def reindex_maker
    maker.reindex
    items.map {
      |item| item.reindex
    }
  end
end