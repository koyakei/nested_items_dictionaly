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

ActiveRecord::Schema.define(version: 20180322145707) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accessories", force: :cascade do |t|
    t.bigint "base_item_id", null: false
    t.bigint "accessory_item_id", null: false
    t.datetime "created_at", default: -> { "now()" }, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
    t.index ["accessory_item_id"], name: "index_accessories_on_accessory_item_id"
    t.index ["base_item_id"], name: "index_accessories_on_base_item_id"
  end

  create_table "additional_conditions", force: :cascade do |t|
    t.text "name", null: false
    t.datetime "created_at", default: -> { "now()" }, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
  end

  create_table "attributes", force: :cascade do |t|
    t.bigint "standard_unit_id", null: false
    t.text "name", null: false
    t.datetime "created_at", default: -> { "now()" }, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
    t.index ["standard_unit_id"], name: "index_attributes_on_standard_unit_id"
  end

  create_table "costs_for_items", force: :cascade do |t|
    t.bigint "user_id", default: 1, null: false
    t.bigint "item_id", null: false
    t.float "cost_ratio"
    t.integer "selling_cost"
    t.integer "freight_cost_in"
    t.integer "freight_cost_out"
    t.integer "storage_cost", comment: "倉庫内の移動コストが大半なので、１日ごとのコストでは計算しない"
    t.datetime "created_at", default: -> { "now()" }, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
    t.index ["item_id"], name: "index_costs_for_items_on_item_id"
    t.index ["user_id"], name: "index_costs_for_items_on_user_id"
  end

  create_table "display_units", force: :cascade do |t|
    t.bigint "standard_unit_id", null: false
    t.text "name", null: false
    t.float "display_ratio", null: false
    t.datetime "created_at", default: -> { "now()" }, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
    t.index ["name"], name: "index_display_units_on_name", unique: true
    t.index ["standard_unit_id"], name: "index_display_units_on_standard_unit_id"
  end

  create_table "grades", force: :cascade do |t|
    t.text "name", null: false
    t.text "description"
    t.datetime "created_at", default: -> { "now()" }, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
  end

  create_table "item_additional_conditions", force: :cascade do |t|
    t.bigint "item_id"
    t.bigint "additional_condition_id"
    t.float "discount_ratio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["additional_condition_id"], name: "index_item_additional_conditions_on_additional_condition_id"
    t.index ["item_id"], name: "index_item_additional_conditions_on_item_id"
  end

  create_table "item_aliases", force: :cascade do |t|
    t.bigint "item_id"
    t.text "name"
    t.bigint "creator_id", null: false
    t.datetime "created_at", default: -> { "now()" }, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
    t.index ["creator_id"], name: "index_item_aliases_on_creator_id"
    t.index ["item_id"], name: "index_item_aliases_on_item_id"
  end

  create_table "item_attributes", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.bigint "attribute_id", null: false
    t.bigint "display_unit_id", null: false
    t.float "value", null: false
    t.datetime "created_at", default: -> { "now()" }, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
    t.index ["attribute_id"], name: "index_item_attributes_on_attribute_id"
    t.index ["display_unit_id"], name: "index_item_attributes_on_display_unit_id"
    t.index ["item_id"], name: "index_item_attributes_on_item_id"
  end

  create_table "item_grades_discounts", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.bigint "grade_id", null: false
    t.bigint "user_id", null: false
    t.float "discount_ration", null: false
    t.datetime "created_at", default: -> { "now()" }, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
    t.index ["grade_id"], name: "index_item_grades_discounts_on_grade_id"
    t.index ["item_id"], name: "index_item_grades_discounts_on_item_id"
    t.index ["user_id"], name: "index_item_grades_discounts_on_user_id"
  end

  create_table "item_images", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.text "image_path", null: false
    t.text "name"
    t.text "description"
    t.datetime "created_at", default: -> { "now()" }, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
    t.index ["item_id"], name: "index_item_images_on_item_id"
  end

  create_table "items", force: :cascade do |t|
    t.integer "max_threshold_price", null: false
    t.integer "min_threshold_price", default: 0, null: false
    t.text "description"
    t.integer "prospected_price"
    t.boolean "has_child", default: true, null: false
    t.boolean "is_visible", default: true, null: false
    t.bigint "maker_id", default: 1, null: false
    t.text "maker_model_number_full"
    t.text "maker_model_number"
    t.text "asin_isbn13"
    t.text "ean"
    t.text "url"
    t.integer "automatic_assessment_type", limit: 2
    t.bigint "creator_id", null: false
    t.datetime "created_at", default: -> { "now()" }, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
    t.bigint "parent_item_id"
    t.bigint "item_alias_id", null: false
    t.index ["creator_id"], name: "index_items_on_creator_id"
    t.index ["item_alias_id"], name: "index_items_on_item_alias_id"
    t.index ["maker_id"], name: "index_items_on_maker_id"
    t.index ["parent_item_id"], name: "index_items_on_parent_item_id"
  end

  create_table "logistic_order_templates", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.string "logistic_order_templatable_type", null: false
    t.bigint "logistic_order_templatable_id", null: false
    t.datetime "created_at", default: -> { "now()" }, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
    t.bigint "logistic_order_template_type_id"
    t.bigint "creator_id", default: 1, null: false
    t.index ["creator_id"], name: "index_logistic_order_templates_on_creator_id"
    t.index ["item_id"], name: "index_logistic_order_templates_on_item_id"
    t.index ["logistic_order_templatable_type", "logistic_order_templatable_id"], name: "index_logistic_templates_on_type_and_template"
    t.index ["logistic_order_template_type_id"], name: "index_logistic_templates_on_logistic_template_type_id"
  end

  create_table "maker_aliases", force: :cascade do |t|
    t.bigint "maker_id", null: false
    t.text "name", null: false
    t.datetime "created_at", default: -> { "now()" }, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
    t.bigint "creator_id", default: 1, null: false
    t.index ["creator_id"], name: "index_maker_aliases_on_creator_id"
    t.index ["maker_id"], name: "index_maker_aliases_on_maker_id"
  end

  create_table "makers", force: :cascade do |t|
    t.text "description"
    t.text "url"
    t.datetime "created_at", default: -> { "now()" }, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
    t.bigint "maker_alias_id"
    t.index ["maker_alias_id"], name: "index_makers_on_maker_alias_id"
  end

  create_table "standard_units", force: :cascade do |t|
    t.text "name", null: false
    t.index ["name"], name: "index_standard_units_on_name", unique: true
  end

  create_table "tag_items", force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.bigint "item_id", null: false
    t.bigint "creator_id", default: 1, null: false
    t.datetime "created_at", default: -> { "now()" }, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
    t.index ["creator_id"], name: "index_tag_items_on_creator_id"
    t.index ["item_id"], name: "index_tag_items_on_item_id"
    t.index ["tag_id"], name: "index_tag_items_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.text "name", null: false
    t.text "description"
    t.bigint "creator_id", null: false
    t.datetime "created_at", default: -> { "now()" }, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
    t.index ["creator_id"], name: "index_tags_on_creator_id"
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.text "cognito_id"
    t.datetime "created_at", default: -> { "now()" }, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
    t.index ["cognito_id"], name: "index_users_on_cognito_id", unique: true
  end

  create_table "yamato_handling_type_codes", force: :cascade do |t|
    t.text "code", null: false
    t.text "name", null: false
    t.index ["code"], name: "index_yamato_handling_type_codes_on_code", unique: true
  end

  create_table "yamato_logistic_order_templates", force: :cascade do |t|
    t.bigint "yamato_size_item_code_id", null: false
    t.bigint "yamato_packing_item_code_id", null: false
    t.bigint "yamato_handling_type_code_id", null: false
    t.datetime "created_at", default: -> { "now()" }, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
    t.bigint "creator_id", default: 1, null: false
    t.index ["creator_id"], name: "index_yamato_logistic_order_templates_on_creator_id"
    t.index ["yamato_handling_type_code_id"], name: "index_yamato_templates_on_yamato_handling_code_id"
    t.index ["yamato_packing_item_code_id"], name: "index_yamato_templates_on_yamato_packing_code_id"
    t.index ["yamato_size_item_code_id"], name: "index_yamato_templates_on_yamato_item_code_id"
  end

  create_table "yamato_packing_item_codes", force: :cascade do |t|
    t.text "code", null: false
    t.text "name", null: false
    t.index ["code"], name: "index_yamato_packing_item_codes_on_code", unique: true
  end

  create_table "yamato_size_item_codes", force: :cascade do |t|
    t.text "code_from", null: false
    t.text "name_from", null: false
    t.text "code_to", null: false
    t.text "name_to", null: false
    t.text "size", null: false
    t.index ["code_from"], name: "index_yamato_size_item_codes_on_code_from", unique: true
    t.index ["code_to"], name: "index_yamato_size_item_codes_on_code_to", unique: true
    t.index ["size"], name: "index_yamato_size_item_codes_on_size", unique: true
  end

  add_foreign_key "accessories", "items", column: "accessory_item_id"
  add_foreign_key "accessories", "items", column: "base_item_id"
  add_foreign_key "attributes", "standard_units"
  add_foreign_key "costs_for_items", "items"
  add_foreign_key "costs_for_items", "users"
  add_foreign_key "display_units", "standard_units"
  add_foreign_key "item_additional_conditions", "additional_conditions"
  add_foreign_key "item_additional_conditions", "items"
  add_foreign_key "item_aliases", "items"
  add_foreign_key "item_aliases", "users", column: "creator_id"
  add_foreign_key "item_attributes", "attributes"
  add_foreign_key "item_attributes", "display_units"
  add_foreign_key "item_attributes", "items"
  add_foreign_key "item_grades_discounts", "grades"
  add_foreign_key "item_grades_discounts", "items"
  add_foreign_key "item_grades_discounts", "users"
  add_foreign_key "item_images", "items"
  add_foreign_key "items", "item_aliases"
  add_foreign_key "items", "items", column: "parent_item_id"
  add_foreign_key "items", "makers"
  add_foreign_key "items", "users", column: "creator_id"
  add_foreign_key "logistic_order_templates", "items"
  add_foreign_key "logistic_order_templates", "users", column: "creator_id"
  add_foreign_key "maker_aliases", "makers"
  add_foreign_key "maker_aliases", "users", column: "creator_id"
  add_foreign_key "makers", "maker_aliases"
  add_foreign_key "tag_items", "items"
  add_foreign_key "tag_items", "tags"
  add_foreign_key "tag_items", "users", column: "creator_id"
  add_foreign_key "tags", "users", column: "creator_id"
  add_foreign_key "yamato_logistic_order_templates", "users", column: "creator_id"
  add_foreign_key "yamato_logistic_order_templates", "yamato_handling_type_codes"
  add_foreign_key "yamato_logistic_order_templates", "yamato_packing_item_codes"
  add_foreign_key "yamato_logistic_order_templates", "yamato_size_item_codes"
end
