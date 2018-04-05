module LogisticOrderTemplatable
  module Yamato
    class LogisticOrderTemplate < ApplicationRecord
      include LogisticOrderTemplatable
      self.table_name = :yamato_logistic_order_templates

      belongs_to :yamato_size_item_code,
                 class_name: LogisticOrderTemplatable::Yamato::
                     Elements::SizeItemCode.to_s
      belongs_to :yamato_packing_item_code,
                 class_name: LogisticOrderTemplatable::Yamato::
                     Elements::PackingItemCode.to_s
      belongs_to :yamato_handling_type_code1,
                 class_name: LogisticOrderTemplatable::Yamato::
                     Elements::HandlingTypeCode.to_s
      belongs_to :yamato_handling_type_code2,
                 class_name: LogisticOrderTemplatable::Yamato::
                     Elements::HandlingTypeCode.to_s

      belongs_to :creator, class_name: User.to_s


      validates_presence_of :creator, :yamato_size_item_code,
                            :yamato_packing_item_code,
                            :yamato_handling_type_code1,
                            :yamato_handling_type_code2

      def get_size
        {from: LogisticSize.new(
          code: yamato_size_item_code.code_from,
          size: yamato_size_item_code.size),
         to: LogisticSize.new(
           code: yamato_size_item_code.code_to,
           size: yamato_size_item_code.size)
        }
      end
      # SELECT * FROM yamato_logistic_order_templates where id in (SELECT  "logistic_order_templates"."logistic_order_templatable_id" FROM "logistic_order_templates" WHERE "logistic_order_templates"."logistic_order_templatable_type" = 'LogisticOrderTemplatable::Yamato::LogisticOrderTemplate' AND "logistic_order_templates"."item_id" IN (0, 1, 2) ORDER BY "logistic_order_templates"."id" ASC)

      def set_values(item_id)
        # logistic_order_templatable.item.id

        ActiveRecord::Base.connection.select_one(<<-SQL,
          WITH RECURSIVE rec(id, parent_item_id,
     depth, start_id
      )AS (
            SELECT
             t1.id,
             t1.parent_item_id,
             1 ,
             t1.id,
             y1.yamato_size_item_code_id,
             y1.yamato_packing_item_code_id,
                     y1.yamato_handling_type_code1_id
            FROM (items t1 left join logistic_order_templates on (t1.id = logistic_order_templates.item_id)) 
          left join yamato_logistic_order_templates  y1 on (y1.id = logistic_order_templates.logistic_order_templatable_id )
            WHERE t1.id = #{item_id}
            UNION ALL
            SELECT
            t1.id,
            t1.parent_item_id,
             rec.depth + 1,
             rec.start_id,
             COALESCE( rec.yamato_size_item_code_id, y1.yamato_size_item_code_id),
             COALESCE( rec.yamato_packing_item_code_id, y1.yamato_packing_item_code_id),
             COALESCE( rec.yamato_handling_type_code1_id, y1.yamato_handling_type_code1_id)
            FROM (items t1 left join logistic_order_templates on (t1.id = logistic_order_templates.item_id)) 
          left join yamato_logistic_order_templates  y1 on (y1.id = logistic_order_templates.logistic_order_templatable_id ), rec
            WHERE  rec.parent_item_id =  t1.id )
          SELECT
            rec.id,depth, yamato_size_item_code_id, yamato_packing_item_code_id,
            yamato_handling_type_code1_id, ic.code_from , ic.code_to , ic.name_from , ic.name_to, ic.size, pc1.*
          FROM (rec left join yamato_size_item_codes ic on( yamato_size_item_code_id = ic.id)) left join yamato_packing_item_codes pc1 on (yamato_packing_item_code_id = pc1.id)
          order by depth desc limit 1
                                                 SQL
        )
      end
    end
  end
end