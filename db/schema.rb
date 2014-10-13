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

ActiveRecord::Schema.define(version: 20141013035430) do

  create_table "assets", force: true do |t|
    t.string   "asset_tag"
    t.string   "asset_name"
    t.string   "serial_number"
    t.date     "purchase_date"
    t.float    "cost"
    t.string   "status"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assets_rentals", force: true do |t|
    t.integer  "asset_id"
    t.integer  "rental_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assets_rentals", ["asset_id"], name: "index_assets_rentals_on_asset_id"
  add_index "assets_rentals", ["rental_id"], name: "index_assets_rentals_on_rental_id"

  create_table "categories", force: true do |t|
    t.string   "category_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "manufacturers", force: true do |t|
    t.string   "manufacturer_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "models", force: true do |t|
    t.string   "model_name"
    t.string   "model_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rentals", force: true do |t|
    t.integer  "user_id"
    t.datetime "checkout_time"
    t.datetime "checkin_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rentals", ["user_id"], name: "index_rentals_on_user_id"

  create_table "states", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tokens", force: true do |t|
    t.integer  "user_id"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tokens", ["user_id"], name: "index_tokens_on_user_id"

  create_table "users", force: true do |t|
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
  end

end
