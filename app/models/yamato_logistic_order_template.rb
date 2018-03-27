class YamatoLogisticOrderTemplate < ApplicationRecord
  belongs_to :yamato_size_item_code
  belongs_to :yamato_packing_item_code
  belongs_to :yamato_handling_type_code
  has_one :logistic_order_template, as: :logistic_order_templatable
end
