class Item < ApplicationRecord
  searchkick word_start: [:name, :maker_name]
  # , merge_mappings: true, mappings: {item: {
  #   "unit.*": {
  #     name: {type: "float"}
  #   }
  # }}
  after_commit :reindex_descendant
  class HasChildrenError < StandardError; end
  has_many :children_items, class_name: Item.to_s, foreign_key: :parent_item_id, primary_key: :id
  belongs_to :creator, class_name: User.to_s
  belongs_to :maker, optional: true
  has_many :item_aliases, dependent: :delete_all
  belongs_to :parent_item, class_name: Item.to_s, optional: false
  has_many :costs_for_items, dependent: :delete_all
  has_many :logistic_order_templates, dependent: :delete_all
  has_many :accessories
  has_many :item_images, dependent: :delete_all
  has_many :tag_items, dependent: :delete_all
  has_many :tags, through: :tag_items, dependent: :delete_all
  has_many :item_attribute_types, dependent: :delete_all
  has_many :attribute_types, through: :item_attribute_types
  has_many :display_units, through: :item_attribute_types
  scope :top_level, -> { where(parent_item_id: nil) }
  scope :search_import, -> { includes(:maker) }

  validates_numericality_of :max_threshold_price, only_integer: true, allow_nil: true
  validates :min_threshold_price, numericality: :only_integer, if: :nil?

  validates :asin, length: { is: 10, too_short: "最小%{count}文字まで使用できます", too_long: "最大%{count}文字まで使用できます" }, allow_blank: true
  validates :isbn13, length: { is: 14, too_short: "最小%{count}文字まで使用できます ISBN13に変換してください", too_long: "最大%{count}文字まで使用できます" }, allow_blank: true
  validates :ean, length: { minimum: 8, maximum: 13, too_short: "最小%{count}文字まで使用できます", too_long: "最大%{count}文字まで使用できます" }, allow_blank: true

  validates :url, format: { with: /\A#{URI::regexp(%w(http https))}\z/, message: "URLのみが使用できます" }, allow_blank: true
  validates :parent_item, :name, presence: true
  validates :name, uniqueness: true

  def search_data
    result = set_values
    return if result.nil?
    maker_aliases_name = ""
    maker_aliases_name = maker&.maker_aliases.map { |al| next "" if al.nil?
    al.name } unless maker.nil? || maker.maker_aliases.nil?
    category_path = ""
    category_path = result["category_path"] if result.key?("category_path")

    {
      id: id, name: name, maker_name: maker&.name, creator_id: creator.id, parent_item_id: parent_item&.id,
      maker_aliases: maker_aliases_name, item_aliases: item_aliases&.map(&:name),
      category_path_id: category_path, maker_root_id: result["maker_root_id"],
      maker_id: result["maker_id"], max_threshold_price: result["max_threshold_price"],
      min_threshold_price: result["min_threshold_price"], is_visible: result["is_visible"]
    }.merge(units)
  end

  def units
    item_attribute_types&.map {
      |item_attribute|
      ["unit.#{item_attribute.attribute_type.name}",  item_attribute.display_unit.display_ratio * item_attribute.value]
    }.to_h
  end

  def reindex_descendant
    search_data
    descendants(children_items) if children_items.present?
  end

  def reindex_descendant2(children_items)
    descendants(children_items) if children_items.present?
  end

  def descendants(children_items)
    children_items.map { |child|
      child.reindex
      reindex_descendant2(child.children_items) if child.children_items.present?
    }
  end

  # def destroy
  #   # raise Item::HasChildrenError.new("has child items") unless children_items.count == 0
  #   super
  # end

  def set_values
    ActiveRecord::Base.connection.select_one(<<-SQL,
      WITH RECURSIVE rec(id, item_alias_id , parent_item_id, description,
       depth, start_id, maker_id ,maker_root_id,maker_name, min_threshold_price, max_threshold_price, name,
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
         t1.id,
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
         (CASE WHEN rec.maker_id is null THEN t2.id ELSE rec.maker_root_id end) as maker_root_id,
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
        rec.maker_root_id,
        rec.name,
        rec.max_threshold_price,
        rec.min_threshold_price,
        rec.is_visible
      FROM rec order by depth desc
      limit 1
                                             SQL
    )
  end
end