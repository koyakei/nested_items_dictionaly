class Admin::MakerAlias < ApplicationRecord
  belongs_to :maker, :class_name => 'Admin::Maker'
end
