class Maker < ApplicationRecord
  belongs_to :maker_alias, optional: true
  has_many :maker_aliases
end
