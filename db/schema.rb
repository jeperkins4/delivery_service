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

ActiveRecord::Schema.define(version: 20160413050755) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "drivers", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "license"
    t.string   "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "drivers", ["user_id"], name: "index_drivers_on_user_id", using: :btree

  create_table "franchises", force: :cascade do |t|
    t.string   "name"
    t.string   "merchant_key"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "location"
    t.decimal  "latitude"
    t.decimal  "longitude"
  end

  create_table "items", force: :cascade do |t|
    t.integer  "menu_id"
    t.string   "name"
    t.string   "description"
    t.money    "price",       scale: 2
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "position"
  end

  add_index "items", ["menu_id"], name: "index_items_on_menu_id", using: :btree

  create_table "menus", force: :cascade do |t|
    t.integer  "place_id"
    t.string   "name"
    t.string   "description"
    t.text     "category",    default: [],              array: true
    t.text     "hours",       default: [],              array: true
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "position"
  end

  add_index "menus", ["place_id"], name: "index_menus_on_place_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "place_id"
    t.string   "status"
    t.datetime "placed_at"
    t.datetime "pickup_at"
    t.datetime "delivered_at"
    t.string   "rating"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "postal_code"
    t.string   "phone"
    t.integer  "driver_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "orders", ["driver_id"], name: "index_orders_on_driver_id", using: :btree
  add_index "orders", ["place_id"], name: "index_orders_on_place_id", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "places", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "postal_code"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.text     "hours"
    t.string   "phone"
    t.string   "email"
    t.string   "website"
    t.string   "factual_key"
    t.text     "category"
    t.string   "neighborhood"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "position"
    t.integer  "franchise_id"
  end

  add_index "places", ["franchise_id"], name: "index_places_on_franchise_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "time_zone"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.integer  "franchise_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["franchise_id"], name: "index_users_on_franchise_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  add_foreign_key "drivers", "users"
  add_foreign_key "items", "menus"
  add_foreign_key "menus", "places"
  add_foreign_key "orders", "drivers"
  add_foreign_key "orders", "places"
  add_foreign_key "orders", "users"
  add_foreign_key "places", "franchises"
  add_foreign_key "users", "franchises"
end
