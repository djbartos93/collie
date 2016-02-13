# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160213075836) do

  create_table "asset_tags", force: :cascade do |t|
    t.string   "tag_number"
    t.integer  "asset_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "asset_tags", ["asset_id"], name: "index_asset_tags_on_asset_id"

  create_table "assets", force: :cascade do |t|
    t.string   "asset_name"
    t.string   "serial_number"
    t.date     "purchase_date"
    t.float    "cost"
    t.string   "status"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "type_id"
    t.text     "description"
    t.string   "location"
    t.string   "model_number"
    t.integer  "manufacturer_id"
    t.integer  "state_id"
    t.string   "part_number"
    t.string   "location_id"
  end

  add_index "assets", ["manufacturer_id"], name: "index_assets_on_manufacturer_id"
  add_index "assets", ["state_id"], name: "index_assets_on_state_id"
  add_index "assets", ["type_id"], name: "index_assets_on_type_id"

  create_table "assets_rentals", id: false, force: :cascade do |t|
    t.integer  "asset_id"
    t.integer  "rental_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assets_rentals", ["asset_id"], name: "index_assets_rentals_on_asset_id"
  add_index "assets_rentals", ["rental_id"], name: "index_assets_rentals_on_rental_id"

  create_table "assets_types", id: false, force: :cascade do |t|
    t.integer  "asset_id"
    t.integer  "type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assets_types", ["asset_id"], name: "index_assets_types_on_asset_id"
  add_index "assets_types", ["type_id"], name: "index_assets_types_on_type_id"

  create_table "categories", force: :cascade do |t|
    t.string   "category_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", force: :cascade do |t|
    t.string   "item_id"
    t.string   "box_number"
    t.string   "wire_number"
    t.integer  "start_foot"
    t.integer  "end_foot"
    t.integer  "pulled_length"
    t.boolean  "jack_lock"
    t.integer  "qty_used"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "manufacturers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "project_name"
    t.string   "account_number"
    t.boolean  "complete"
    t.integer  "job_id"
    t.text     "notes"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "status"
  end

  create_table "rentals", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "checkout_time"
    t.datetime "checkin_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "event_title"
    t.string   "event_location"
    t.string   "event_description"
    t.date     "event_date"
    t.boolean  "setup_help"
    t.text     "equipment_needed"
  end

  add_index "rentals", ["user_id"], name: "index_rentals_on_user_id"

  create_table "settings", force: :cascade do |t|
    t.string  "type",         null: false
    t.string  "string_value"
    t.integer "int_value"
    t.date    "date_value"
  end

  add_index "settings", ["type"], name: "index_settings_on_type", unique: true

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tokens", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tokens", ["user_id"], name: "index_tokens_on_user_id"

  create_table "types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "org"
    t.string   "password_digest"
    t.string   "external_id"
    t.boolean  "active",          default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
    t.boolean  "confirmed"
    t.string   "confirm_key"
    t.string   "phone"
  end

end
