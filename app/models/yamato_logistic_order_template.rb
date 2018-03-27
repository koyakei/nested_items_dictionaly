class YamatoLogisticOrderTemplate < ApplicationRecord
  belongs_to :yamato_size_item_code
  belongs_to :yamato_packing_item_code
  belongs_to :yamato_handling_type_code
  has_one :logistic_order_template, as: :logistic_order_templatable
  belongs_to :creator, class_name: User.to_s

  def set_values(id)
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
                 y1.yamato_handling_type_code_id
        FROM (items t1 left join logistic_order_templates on (t1.id = logistic_order_templates.item_id)) 
      left join yamato_logistic_order_templates  y1 on (y1.id = logistic_order_templates.logistic_order_templatable_id )
        WHERE t1.id = #{id}
        UNION ALL
        SELECT
        t1.id,
        t1.parent_item_id,
         rec.depth + 1,
         rec.start_id,
         COALESCE( rec.yamato_size_item_code_id, y1.yamato_size_item_code_id),
         COALESCE( rec.yamato_packing_item_code_id, y1.yamato_packing_item_code_id),
         COALESCE( rec.yamato_handling_type_code_id, y1.yamato_handling_type_code_id)
        FROM (items t1 left join logistic_order_templates on (t1.id = logistic_order_templates.item_id)) 
      left join yamato_logistic_order_templates  y1 on (y1.id = logistic_order_templates.logistic_order_templatable_id ), rec
        WHERE  rec.parent_item_id =  t1.id )
      SELECT
        rec.id,depth, yamato_size_item_code_id, yamato_packing_item_code_id,
        yamato_handling_type_code_id, ic.code_from , ic.code_to , ic.name_from , ic.name_to, ic.size, pc1.*
      FROM (rec left join yamato_size_item_codes ic on( yamato_size_item_code_id = ic.id)) left join yamato_packing_item_codes pc1 on (yamato_packing_item_code_id = pc1.id)
      order by depth desc limit 1
                                             SQL
    )
  end
end
