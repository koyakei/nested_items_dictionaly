class Tag < ApplicationRecord
  belongs_to :creator, class_name: User.to_s
end
