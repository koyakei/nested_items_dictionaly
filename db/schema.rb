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

ActiveRecord::Schema.define(version: 20180319082026) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "maker_aliases", force: :cascade do |t|
    t.bigint "maker_id", null: false
    t.text "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["maker_id"], name: "index_maker_aliases_on_maker_id"
  end

  create_table "makers", force: :cascade do |t|
    t.text "name", null: false
    t.text "remarks"
    t.text "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_makers_on_name", unique: true
  end

  create_table "yamato_handling_type_codes", force: :cascade do |t|
    t.text "code", null: false
    t.text "name", null: false
    t.index ["code"], name: "index_yamato_handling_type_codes_on_code", unique: true
  end

  create_table "yamato_packing_item_codes", force: :cascade do |t|
    t.text "code", null: false
    t.text "name", null: false
    t.index ["code"], name: "index_yamato_packing_item_codes_on_code", unique: true
  end

  create_table "yamato_size_item_codes", force: :cascade do |t|
    t.text "code", null: false
    t.text "name", null: false
    t.index ["code"], name: "index_yamato_size_item_codes_on_code", unique: true
  end

  add_foreign_key "maker_aliases", "makers"
end
