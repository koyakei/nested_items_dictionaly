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
      WITH RECURSIVE rec(id, parent_item_id, description, depth, start_id, maker_name,name, category_path) 
      AS (
        SELECT
         t1.id,
         t1.parent_item_id,
         t1.description,
         1,
         t1.id,
         m1.description as maker_name,
         t2.name,
         t2.name
        FROM (items t1 inner join item_aliases as t2 on (t1.id = t2.item_id)) inner join makers m1 on (m1.id = t1.maker_id)
        WHERE t1.id = #{id}
        UNION ALL
        SELECT t1.id, t1.parent_item_id, COALESCE (rec.description, t1.description), rec.depth+1, rec.start_id,
        COALESCE (rec.maker_name, m2.description),
        t2.name,
        t2.name || ','|| rec.category_path AS category_path
        FROM (items t1 inner join item_aliases as t2 on (t1.id = t2.item_id)) inner join makers m2 on (m2.id = t1.maker_id), rec
        WHERE t1.id = rec.parent_item_id AND rec.parent_item_id > 0
      )
      SELECT
        start_id,
        name,
        description,
        category_path,
        maker_name
      FROM rec
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