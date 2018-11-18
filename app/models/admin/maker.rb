class Admin::Maker < ApplicationRecord
	has_many :maker_aliases, :class_name => 'Admin::MakerAlias'
	accepts_nested_attributes_for :maker_aliases
end
