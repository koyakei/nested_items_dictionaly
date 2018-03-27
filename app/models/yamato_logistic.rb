class YamatoLogistic < ApplicationRecord
  belongs_to :item
  belongs_to :yamato_size_item_code
  belongs_to :yamato_packing_item_code
  belongs_to :yamato_handling_type_code
end
