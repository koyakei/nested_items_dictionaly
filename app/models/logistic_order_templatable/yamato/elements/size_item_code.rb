module LogisticOrderTemplatable
  module Yamato
    module Elements
      class SizeItemCode < ApplicationRecord
        self.table_name = :yamato_size_item_codes
        has_many :logistic_order_templates, class_name: LogisticOrderTemplatable::Yamato::LogisticOrderTemplate.to_s
      end
    end
  end
end