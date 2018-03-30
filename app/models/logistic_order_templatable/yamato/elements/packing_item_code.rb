module LogisticOrderTemplatable
  module Yamato
    module Elements
      class PackingItemCode < ApplicationRecord
        self.table_name = :yamato_packing_item_codes
        has_many :logistic_order_templates, class_name: LogisticOrderTemplatable::Yamato::LogisticOrderTemplate.to_s
      end
    end
  end
end