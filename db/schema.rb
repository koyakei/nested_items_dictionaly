# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 1) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accessories", id: :serial, force: :cascade do |t|
    t.bigint "base_item_id", null: false
    t.bigint "accessory_item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accessory_item_id"], name: "accessories_accessory_item_index"
    t.index ["accessory_item_id"], name: "index_accessories_on_accessory_item_id"
    t.index ["base_item_id", "accessory_item_id"], name: "index_accessories_on_base_item_id_and_accessory_item_id", unique: true
    t.index ["base_item_id"], name: "accessories_base_item_index"
    t.index ["base_item_id"], name: "index_accessories_on_base_item_id"
  end

  create_table "additional_conditions", id: :serial, force: :cascade do |t|
    t.text "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attributes", id: :serial, force: :cascade do |t|
    t.text "name", null: false
    t.bigint "standard_unit_id", null: false
    t.index ["standard_unit_id"], name: "index_attributes_on_standard_unit_id"
  end

  create_table "business_users", id: :serial, force: :cascade do |t|
    t.text "email_address", null: false
    t.text "access_token"
    t.text "name", null: false
    t.text "company_name", null: false
    t.text "telephone_number"
    t.binary "logo"
  end

  create_table "costs_for_items", id: :serial, force: :cascade do |t|
    t.bigint "business_user_id", null: false
    t.bigint "item_id", null: false
    t.float "cost_ratio", null: false
    t.integer "selling_cost", null: false
    t.integer "freight_cost_in", null: false
    t.integer "freight_cost_out", null: false
    t.integer "storage_cost_per_day", null: false
    t.index ["business_user_id"], name: "index_costs_for_items_on_business_user_id"
    t.index ["item_id"], name: "index_costs_for_items_on_item_id"
  end

  create_table "display_units", id: :serial, force: :cascade do |t|
    t.text "unit", null: false
    t.bigint "standard_unit_id", null: false
    t.float "display_ratio", null: false
    t.index ["standard_unit_id"], name: "index_display_units_on_standard_unit_id"
  end

  create_table "grades", id: :serial, force: :cascade do |t|
    t.text "name", null: false
    t.text "description", null: false
  end

  create_table "item_additional_conditions", id: :serial, force: :cascade do |t|
    t.bigint "item_id", null: false
    t.bigint "additional_condition_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["additional_condition_id"], name: "index_item_additional_conditions_on_additional_condition_id"
    t.index ["additional_condition_id"], name: "item_additional_conditions_additional_condition_index"
    t.index ["item_id", "additional_condition_id"], name: "index_item_add_cond_item_cond", unique: true
    t.index ["item_id"], name: "index_item_additional_conditions_on_item_id"
    t.index ["item_id"], name: "item_additional_conditions_item_index"
  end

  create_table "item_aliases", id: :serial, force: :cascade do |t|
    t.bigint "item_id", null: false
    t.text "alias", null: false
    t.index ["item_id"], name: "index_item_aliases_on_item_id"
    t.index ["item_id"], name: "item_aliases_item_index"
  end

  create_table "item_attributes", id: :serial, force: :cascade do |t|
    t.bigint "item_id", null: false
    t.bigint "attribute_id", null: false
    t.bigint "display_unit_id", null: false
    t.float "value", null: false
    t.integer "effective_digit", null: false
    t.index ["attribute_id"], name: "index_item_attributes_on_attribute_id"
    t.index ["display_unit_id"], name: "index_item_attributes_on_display_unit_id"
    t.index ["item_id"], name: "index_item_attributes_on_item_id"
  end

  create_table "item_grades_discounts", id: :serial, force: :cascade do |t|
    t.bigint "item_id", null: false
    t.bigint "grade_id", null: false
    t.bigint "business_user_id", null: false
    t.float "discount_ratio", null: false
    t.index ["business_user_id"], name: "index_item_grades_discounts_on_business_user_id"
    t.index ["business_user_id"], name: "item_grades_discounts_business_user_index"
    t.index ["grade_id"], name: "index_item_grades_discounts_on_grade_id"
    t.index ["grade_id"], name: "item_grades_discounts_grade_index"
    t.index ["item_id", "grade_id", "business_user_id"], name: "index_discount_item_grade_business_user", unique: true
    t.index ["item_id"], name: "index_item_grades_discounts_on_item_id"
    t.index ["item_id"], name: "item_grades_discounts_item_index"
  end

  create_table "item_images", id: :serial, force: :cascade do |t|
    t.bigint "item_id", null: false
    t.binary "image", null: false
    t.text "name"
    t.text "description"
    t.index ["item_id"], name: "index_item_images_on_item_id"
    t.index ["item_id"], name: "item_images_item_index"
  end

  create_table "item_prospected_prices", id: :serial, force: :cascade do |t|
    t.bigint "item_id", null: false
    t.bigint "business_user_id", null: false
    t.integer "prospected_price", null: false
    t.index ["business_user_id"], name: "index_item_prospected_prices_on_business_user_id"
    t.index ["business_user_id"], name: "item_prospected_prices_business_user_index"
    t.index ["item_id", "business_user_id"], name: "index_item_prospected_prices_on_item_id_and_business_user_id", unique: true
    t.index ["item_id"], name: "index_item_prospected_prices_on_item_id"
    t.index ["item_id"], name: "item_prospected_prices_item_index"
  end

  create_table "items", id: :serial, force: :cascade do |t|
    t.bigint "parent_item_id"
    t.text "name", null: false
    t.integer "max_threshold_price"
    t.integer "min_threshold_price"
    t.text "description"
    t.integer "prospected_price", null: false
    t.integer "weight"
    t.integer "height"
    t.integer "width"
    t.integer "depth"
    t.bigint "yamato_size_item_code_id"
    t.bigint "yamato_handling_type_code_1_id"
    t.bigint "yamato_handling_type_code_2_id"
    t.bigint "yamato_packing_item_code_id"
    t.text "yamato_remarks"
    t.boolean "has_child", default: false, null: false
    t.boolean "is_visible", default: false, null: false
    t.bigint "create_user_id", null: false
    t.bigint "update_user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["create_user_id"], name: "index_items_on_create_user_id"
    t.index ["name"], name: "index_items_on_name"
    t.index ["parent_item_id"], name: "index_items_on_parent_item_id"
    t.index ["parent_item_id"], name: "items_parent_item_id_index"
    t.index ["update_user_id"], name: "index_items_on_update_user_id"
    t.index ["yamato_handling_type_code_1_id"], name: "index_items_on_yamato_handling_type_code_1_id"
    t.index ["yamato_handling_type_code_1_id"], name: "items_yamato_handling_type_code_1_id_index"
    t.index ["yamato_handling_type_code_2_id"], name: "index_items_on_yamato_handling_type_code_2_id"
    t.index ["yamato_handling_type_code_2_id"], name: "items_yamato_handling_type_code_2_id_index"
    t.index ["yamato_packing_item_code_id"], name: "index_items_on_yamato_packing_item_code_id"
    t.index ["yamato_packing_item_code_id"], name: "items_yamato_packing_item_code_id_index"
    t.index ["yamato_size_item_code_id"], name: "index_items_on_yamato_size_item_code_id"
    t.index ["yamato_size_item_code_id"], name: "items_yamato_size_item_code_id_index"
  end

  create_table "makers", id: :serial, force: :cascade do |t|
    t.text "name", null: false
    t.text "legalName", null: false
    t.text "remarks"
    t.text "url"
  end

  create_table "product_informations", id: :serial, force: :cascade do |t|
    t.bigint "item_id", null: false
    t.bigint "maker_id", null: false
    t.text "maker_model_number_full"
    t.text "maker_model_number"
    t.text "asin_isbn13"
    t.text "jan_ean_upc"
    t.text "url"
    t.boolean "automatic_assessment_type", default: false, null: false
    t.index ["item_id"], name: "index_product_informations_on_item_id"
    t.index ["item_id"], name: "product_informations_item_index", unique: true
    t.index ["maker_id"], name: "index_product_informations_on_maker_id"
    t.index ["maker_id"], name: "product_informations_maker_index"
  end

  create_table "standard_units", id: :serial, force: :cascade do |t|
    t.text "unit", null: false
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.text "name", null: false
    t.text "description", null: false
    t.bigint "create_user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["create_user_id"], name: "index_tags_on_create_user_id"
  end

  create_table "tags_items_maps", id: :serial, force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.bigint "item_id", null: false
    t.bigint "create_user_id", null: false
    t.bigint "update_user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["create_user_id"], name: "index_tags_items_maps_on_create_user_id"
    t.index ["item_id"], name: "index_tags_items_maps_on_item_id"
    t.index ["item_id"], name: "tags_items_maps_item_index"
    t.index ["tag_id", "item_id"], name: "index_tags_items_maps_on_tag_id_and_item_id", unique: true
    t.index ["tag_id"], name: "index_tags_items_maps_on_tag_id"
    t.index ["tag_id"], name: "tags_items_maps_tag_index"
    t.index ["update_user_id"], name: "index_tags_items_maps_on_update_user_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.text "name", null: false
    t.text "access_token", null: false
  end

  create_table "yamato_handling_type_codes", id: :serial, force: :cascade do |t|
    t.text "code", null: false
    t.text "name", null: false
  end

  create_table "yamato_packing_item_codes", id: :serial, force: :cascade do |t|
    t.text "code", null: false
    t.text "name", null: false
  end

  create_table "yamato_size_item_codes", id: :serial, force: :cascade do |t|
    t.text "code", null: false
    t.text "name", null: false
  end

end
