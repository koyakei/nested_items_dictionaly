module LogisticOrderTemplatable
  module Yamato
    class BaseModel < ApplicationRecord
      self.abstract_class = true
      def self.table_name_prefix
        'yamato_'
      end
    end
  end
end
