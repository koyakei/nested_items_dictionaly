class Item < ApplicationRecord
  has_many :children_items, class_name: Item.to_s, foreign_key: :parent_item_id
  belongs_to :creator, class_name: User.to_s
  belongs_to :maker, optional: true
  has_many :item_aliases
  belongs_to :parent_item, class_name: Item.to_s, optional: false
  has_many :costs_for_items
  has_many :logistic_order_templates
  has_many :accessories
  has_many :item_images
  # attribute :maker, Maker, default_

  def set_values
    ActiveRecord::Base.connection.select_one(
      <<-SQL,
      WITH RECURSIVE rec(id, item_alias_id , parent_item_id, description,
       depth, start_id, maker_id ,maker_name, name,
        category_path
        )
      AS (
        SELECT
         t1.id,
         t1.name,
         t1.parent_item_id,
         t1.description,
         1 ,
         t1.id,
         t1.maker_id,
         m2.name as maker_name,
         t1.name,
         t1.name
        FROM items t1 left join makers m2 on (t1.maker_id = m2.id)
        WHERE t1.id = #{id}
        UNION ALL
        SELECT
        t1.id,
        rec.item_alias_id,
        t1.parent_item_id,
        (CASE WHEN rec.description is not null THEN rec.description ELSE t1.description END) as description,
         rec.depth + 1,
         rec.start_id,
         COALESCE ( rec.maker_id,t1.maker_id ),
         COALESCE (m2.name, rec.maker_name ) as maker_name,
        t1.name,
         t1.name || ','|| rec.category_path AS category_path
        FROM items t1 left join makers m2 on (t1.maker_id = m2.id), rec
        WHERE rec.parent_item_id = t1.id )
      SELECT
        rec.description,
        rec.category_path,
        rec.maker_id,
        rec.name,
        rec.id
      FROM rec order by depth desc
      limit 1
      SQL
    )
  end
end