class MakerAlias < ApplicationRecord
  belongs_to :maker
  belongs_to :creator, class_name: User.to_s, foreign_key: :creator_id
end
