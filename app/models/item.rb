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

  validates :max_threshold_price, numericality: :only_integer, if: :nil?

  validates :asin, length: {is: 10,
                            too_short: "最小%{count}文字まで使用できます",
                            too_long: "最大%{count}文字まで使用できます"}
  validates :isbn13, length: {is: 14,
                              too_short: "最小%{count}文字まで使用できます ISBN13に変換してください",
                              too_long: "最大%{count}文字まで使用できます"}
  validates :ean, length: {minimum: 8, maximum: 13,
                          too_short: "最小%{count}文字まで使用できます",
                          too_long: "最大%{count}文字まで使用できます"}

  validates :url, format: {with: /\A#{URI::regexp(%w(http https))}\z/,
                           message: "URLのみが使用できます" }
  validates :parent_item, :name, presence: true
  validates :name, uniqueness: true

  def set_values
    ActiveRecord::Base.connection.select_one(
      <<-SQL,
      WITH RECURSIVE rec(id, item_alias_id , parent_item_id, description,
       depth, start_id, maker_id ,maker_name, min_threshold_price, max_threshold_price, name,
        category_path, is_visible
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
         t1.min_threshold_price,
         t1.max_threshold_price,
         t1.name,
         cast(t1.id as text),
          t1.is_visible
        FROM items t1 left join makers m2 on (t1.maker_id = m2.id)
        WHERE t1.id = #{id}
        UNION ALL
        SELECT
        t2.id,
        rec.item_alias_id,
        t2.parent_item_id,
        (CASE WHEN rec.description is not null THEN rec.description ELSE t2.description END) as description,
         rec.depth + 1,
         rec.start_id,
         COALESCE ( rec.maker_id,t2.maker_id ),
         COALESCE (m2.name, rec.maker_name ) as maker_name,
         COALESCE ( rec.min_threshold_price ,t2.min_threshold_price ),
         COALESCE (t2.max_threshold_price, rec.max_threshold_price ),
        t2.name,
         cast(t2.id as text) || ','|| rec.category_path AS category_path,
        t2.is_visible
        FROM items t2 left join makers m2 on (t2.maker_id = m2.id), rec
        WHERE rec.parent_item_id = t2.id )
      SELECT
        rec.description,
        rec.category_path,
        rec.maker_id,
        rec.name,
        rec.max_threshold_price,
        rec.min_threshold_price,
        rec.is_visible
      FROM rec order by depth  desc
      limit 1
      SQL
    )
  end
end