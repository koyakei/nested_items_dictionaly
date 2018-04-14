class MakerAlias < ApplicationRecord
  searchkick
  belongs_to :maker
  belongs_to :creator, class_name: User.to_s, foreign_key: :creator_id

  after_commit :reindex_maker
  def reindex_maker
    maker.reindex
  end
end