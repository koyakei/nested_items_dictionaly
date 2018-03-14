create_table "users", id: :serial, force: :cascade do |t|
  t.text        "name", :null => false
  t.text        "access_token", :null => false
end

create_table "tags", id: :serial, force: :cascade do |t|
  t.text        "name", :null => false
  t.text        "description", :null => false
  t.references  :create_user, :foreign_key => { to_table: :users }, :null => false
  t.timestamps  null: false
end

create_table "yamato_handling_type_codes", id: :serial, force: :cascade do |t|
  t.text        "code", :null => false, :limit => 45
  t.text        "name", :null => false, :limit => 45
end

create_table "yamato_packing_item_codes", id: :serial, force: :cascade do |t|
  t.text        "code", :null => false, :limit => 45
  t.text        "name", :null => false, :limit => 45
end

create_table "yamato_size_item_codes", id: :serial, force: :cascade do |t|
  t.text        "code", :null => false, :limit => 8
  t.text        "name", :null => false, :limit => 45
end

create_table "items", id: :serial, force: :cascade do |t|
  t.references  :parent_item, :foreign_key=> { to_table: :items }
  t.text        "name", :null => false, :limit => 45
  t.integer     "max_threshold_price", :default => nil
  t.integer     "min_threshold_price", :default => nil
  t.text        "description", :default => nil, :limit => 1023
  t.integer     "prospected_price", :null => false
  t.integer     "weight", :default => nil
  t.integer     "height", :default => nil
  t.integer     "width", :default => nil
  t.integer     "depth", :default => nil
  t.references  :yamato_size_item_code, :default => nil, :foreign_key => true
  t.references  :yamato_handling_type_code_1, :default => nil, :foreign_key => { to_table: :yamato_handling_type_code }
  t.references  :yamato_handling_type_code_2, :default => nil, :foreign_key => { to_table: :yamato_handling_type_code }
  t.references  :yamato_packing_item_code, :default => nil, :foreign_key => true
  t.text        "yamato_remarks", :default => nil, :limit => 255
  t.boolean     "has_child", :null => false, :default => false
  t.boolean     "is_visible", :null => false, :default => false
  t.references  :create_user, :foreign_key => { to_table: :users }, :null => false
  t.references  :update_user, :foreign_key => { to_table: :users }, :null => false
  t.timestamps  null: false
  t.index       :name
  t.index       :yamato_size_item_code_id, :name => "items_yamato_size_item_code_id_index"
  t.index       :yamato_handling_type_code_1_id, :name => "items_yamato_handling_type_code_1_id_index"
  t.index       :yamato_handling_type_code_2_id, :name => "items_yamato_handling_type_code_2_id_index"
  t.index       :yamato_packing_item_code_id, :name => "items_yamato_packing_item_code_id_index"
  t.index       :parent_item_id, :name => "items_parent_item_id_index"
end

create_table "grades", id: :serial, force: :cascade do |t|
  t.text        "name", :null => false, :limit => 45
  t.text        "description", :null => false, :limit => 45
end

create_table "tags_items_maps", id: :serial, force: :cascade do |t|
  t.references  :tag, :null => false, :foreign_key => true
  t.references  :item, :null => false, :foreign_key => true
  t.references  :create_user, :foreign_key => { to_table: :users }, :null => false
  t.references  :update_user, :foreign_key => { to_table: :users }, :null => false
  t.timestamps  null: false
  t.index       [:tag_id, :item_id], :unique => true
  t.index       :tag_id, :name =>"tags_items_maps_tag_index"
  t.index       :item_id, :name =>"tags_items_maps_item_index"
end

create_table "business_users", id: :serial, force: :cascade do |t|
  t.text        "email_address", :null => false, :limit => 45
  t.text        "access_token", :default => nil, :limit => 45
  t.text        "name", :null => false, :limit => 45
  t.text        "company_name", :null => false, :limit => 45
  t.text        "telephone_number", :default => nil, :limit => 45
  t.binary      "logo", :limit => 15.megabytes, :default => nil
end

create_table "costs_for_items", id: :serial, force: :cascade do |t|
  t.references  :business_user, :null => false, :foreign_key => true
  t.references  :item, :null => false, :foreign_key => true
  t.float       "cost_ratio", :limit => 53, :null => false
  t.integer     "selling_cost", :null => false
  t.integer     "freight_cost_in", :null => false
  t.integer     "freight_cost_out", :null => false
  t.integer     "storage_cost_per_day", :null => false
end

create_table "item_grades_discounts", id: :serial, force: :cascade do |t|
  t.references  :item, :null => false, :foreign_key => true
  t.references  :grade, :null => false, :foreign_key => true
  t.references  :business_user, :null => false, :foreign_key => true
  t.float       "discount_ratio", :limit => 53, :null => false
  t.index       [:item_id, :grade_id, :business_user_id], :unique => true, :name => "index_discount_item_grade_business_user"
  t.index       :grade_id, :name => "item_grades_discounts_grade_index"
  t.index       :item_id, :name => "item_grades_discounts_item_index"
  t.index       :business_user_id, :name => "item_grades_discounts_business_user_index"
end

create_table "item_aliases", id: :serial, force: :cascade do |t|
  t.references  :item, :null => false, :foreign_key => true
  t.text        "alias", :null => false, :limit => 255
  t.index       :item_id, :name => "item_aliases_item_index"
end

create_table "item_images", id: :serial, force: :cascade do |t|
  t.references  :item, :null => false, :foreign_key => true
  t.binary      "image", :limit => 15.megabytes, :null => false
  t.text        "name", :default => nil, :limit => 45
  t.text        "description", :default => nil, :limit => 255
  t.index       :item_id, :name => "item_images_item_index"
end

create_table "standard_units", id: :serial, force: :cascade do |t|
  t.text        "unit", :null => false, :limit => 5
end

create_table "display_units", id: :serial, force: :cascade do |t|
  t.text        "unit", :null => false, :limit => 5
  t.references  :standard_unit, :null => false, :foreign_key => true
  t.float       "display_ratio", :limit => 53, :null => false
end

create_table "attributes", id: :serial, force: :cascade do |t|
  t.text        "name", :null => false, :limit => 45
  t.references  :standard_unit, :null => false, :foreign_key => true
end

create_table "item_attributes", id: :serial, force: :cascade do |t|
  t.references  :item, :null => false, :foreign_key => true
  t.references  :attribute, :null => false, :foreign_key => true
  t.references  :display_unit, :null => false, :foreign_key => true
  t.float       "value", :limit => 53, :null => false
  t.integer     "effective_digit", :null => false
end

create_table "additional_conditions", id: :serial, force: :cascade do |t|
  t.text        "name", :null => false, :limit => 45
  t.timestamps  null: false
end

create_table "item_additional_conditions", id: :serial, force: :cascade do |t|
  t.references  :item, :null => false, :foreign_key => true
  t.references  :additional_condition, :null => false, :foreign_key => true
  t.timestamps  null: false
  t.index       [:item_id, :additional_condition_id], :unique => true, :name => "index_item_add_cond_item_cond"
  t.index       :item_id, :name => "item_additional_conditions_item_index"
  t.index       :additional_condition_id, :name => "item_additional_conditions_additional_condition_index"
end

create_table "accessories", id: :serial, force: :cascade do |t|
  t.references  :base_item, :null => false, :foreign_key => true
  t.references  :accessory_item, :null => false, :foreign_key => true
  t.timestamps  null: false
  t.index       [:base_item_id, :accessory_item_id], :unique => true
  t.index       :base_item_id, :name => "accessories_base_item_index"
  t.index       :accessory_item_id, :name => "accessories_accessory_item_index"
end

create_table "makers", id: :serial, force: :cascade do |t|
  t.text        "name", :null => false, :limit => 45
  t.text        "legalName", :null => false, :limit => 255
  t.text        "remarks", :default => nil, :limit => 1023
  t.text        "url", :default => nil, :limit => 1023
end

create_table "product_informations", id: :serial, force: :cascade do |t|
  t.references  :item, :null => false, :foreign_key => true
  t.references  :maker, :null => false, :foreign_key => true
  t.text        "maker_model_number_full", :default => nil, :limit => 255
  t.text        "maker_model_number", :default => nil, :limit => 45
  t.text        "asin_isbn13", :default => nil, :limit => 15
  t.text        "jan_ean_upc", :default => nil, :limit => 15
  t.text        "url", :default => nil, :limit => 1023
  t.boolean     "automatic_assessment_type", :null => false, :default => false
  t.index       :item_id, :unique => true, :name => "product_informations_item_index"
  t.index       :maker_id, :name => "product_informations_maker_index"
end

create_table "item_prospected_prices", id: :serial, force: :cascade do |t|
  t.references  :item, :null => false, :foreign_key => true
  t.references  :business_user, :null => false, :foreign_key => true
  t.integer     "prospected_price", :null => false
  t.index       [:item_id, :business_user_id], :unique => true
  t.index       :item_id, :name => "item_prospected_prices_item_index"
  t.index       :business_user_id, :name => "item_prospected_prices_business_user_index"
end
