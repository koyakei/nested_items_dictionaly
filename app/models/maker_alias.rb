class MakerAlias < ApplicationRecord
  belongs_to :maker
  belongs_to :creator, class_name: User
end
