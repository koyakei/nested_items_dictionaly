class Item < ApplicationRecord
  has_many :children_items, class_name: Item.to_s, foreign_key: :parent_item_id
  belongs_to :creator, class_name: User.to_s
  belongs_to :maker
  has_many :item_aliases
  belongs_to :item_alias
  belongs_to :parent_item, class_name: Item.to_s, optional: false
  has_many :costs_for_items
  has_many :logistic_order_templates
  has_many :accessories
  has_many :item_images

  def set_values(id)
    ActiveRecord::Base.connection.select_one(<<-SQL,
      WITH RECURSIVE rec(id, parent_item_id, description,
 depth, start_id, maker_id ,maker_name, name,
  category_path
  ) 
      AS (
        SELECT
         t1.id,
         t1.parent_item_id,
         t1.description,
         1 ,
         t1.id,
         t1.maker_id,
         ma1.name as maker_name,
         t2.name,
         t2.name
        FROM ((items t1 inner join item_aliases as t2 on (t1.id = t2.item_id)) 
        inner join makers m1 on (m1.id = t1.maker_id)) inner join maker_aliases ma1 on (m1.maker_alias_id = ma1.id)
        WHERE t1.id = 1
        UNION ALL
        SELECT 
        t1.id,
        t1.parent_item_id, 
        COALESCE ( t1.description, rec.description) as description,
         rec.depth - 1,
         rec.start_id,
         t1.maker_id,
         COALESCE (ma2.name, rec.maker_name ) as maker_name,
        t2.name,
         rec.category_path || ','|| t2.name AS category_path
        FROM (items t1 inner join item_aliases as t2 on (t1.id = t2.item_id)) 
        inner join makers m2 on (m2.id = t1.maker_id)  inner join maker_aliases ma2 on (m2.maker_alias_id = ma2.id), rec
        WHERE t1.parent_item_id = rec.id AND rec.id <= 3)
      SELECT
        id,
        name,
        description,
        category_path,
        maker_id
      FROM rec order by depth
      limit 1
                                                 SQL
    )
    Category.grades.keys.each do |grade|
      eval("self.#{grade}_name ||= r['#{grade}_name']")
      eval("self.#{grade}_description ||= r['#{grade}_description']")
      eval("self.#{grade}_deprecation_ratio ||= r['#{grade}_deprecation_ratio']")
    end
    # self.attributes.each do |key ,val|
    #   if !["price_n", "price_a", "price_b", "price_c", "price_d", "price_e", "price_f", "price_",
    #       "prospected_price","prospected_price_investigated_n",
    #       "prospected_price_investigated_a","prospected_price_investigated_c" ,
    #       "text_3","text_1","text_2","name_hiragana","name","name_katakana",
    #       "scraped_domain","inversion","scraped_at","memo",'url',
    #       "manufacturer_part_number","manufacturer_part_number_full","asin_isbn13","ean",
    #       "grade","assessment_price","prospected_price","description"].include?(key)
    #     raise "nil #{key}" if val.nil?
    #   end
    # end
  end
end