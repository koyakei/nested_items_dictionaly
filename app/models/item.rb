class Item < ApplicationRecord
  has_many :children_items, class_name: Item.to_s, foreign_key: :parent_item_id
  belongs_to :creator, class_name: User.to_s
  belongs_to :maker
  has_many :item_aliases
  belongs_to :parent_item, class_name: Item.to_s, optional: false
  has_many :costs_for_items
  has_many :logistic_order_templates
  has_many :accessories
  has_many :item_images

  def set_values(id)
    ActiveRecord::Base.connection.select_one(
      <<-SQL,
      WITH RECURSIVE rec(id, item_alias_id , parent_item_id, description,
       depth, start_id, maker_id ,maker_name, name,
        category_path
        )
      AS (
        SELECT
         t1.id,
         t1.item_alias_id,
         t1.parent_item_id,
         t1.description,
         1 ,
         t1.id,
         t1.maker_id,
         ma1.name as maker_name,
         t2.name,
         t2.name
        FROM ((items t1 left join item_aliases as t2 on (t1.id = t2.item_id)) 
        left join makers m1 on (m1.id = t1.maker_id)) left join maker_aliases ma1 on (m1.maker_alias_id = ma1.id)
        WHERE t1.id = #{id}
        UNION ALL
        SELECT
        t1.id,
        rec.item_alias_id,
        t1.parent_item_id,
        (CASE WHEN rec.description is not null THEN  rec.description ELSE t1.description END) as description,
         rec.depth + 1,
         rec.start_id,
         t1.maker_id,
         COALESCE (ma2.name, rec.maker_name ) as maker_name,
        t2.name,
         t2.name || ','|| rec.category_path AS category_path
        FROM (items t1 left join item_aliases as t2 on (t1.id = t2.item_id)) 
        left join makers m2 on (m2.id = t1.maker_id)  left join maker_aliases ma2 on (m2.maker_alias_id = ma2.id), rec
        WHERE  rec.parent_item_id =  t1.id )
      SELECT
        rec.description,
        rec.category_path,
        rec.maker_id,
        ia3.name
      FROM rec inner join item_aliases ia3 on (rec.item_alias_id = ia3.id ) order by depth desc
      limit 1
      SQL
    )
  end
end