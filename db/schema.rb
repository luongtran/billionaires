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

ActiveRecord::Schema.define(version: 20170228033725) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachments", force: :cascade do |t|
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.string   "attachmentable_type"
    t.integer  "attachmentable_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["attachmentable_type", "attachmentable_id"], name: "index_attachments_on_attachmentable_type_and_attachmentable_id", using: :btree
  end

  create_table "cars", force: :cascade do |t|
    t.string   "type"
    t.string   "brand"
    t.string   "model"
    t.text     "description"
    t.integer  "seats"
    t.integer  "power"
    t.integer  "max_speed"
    t.string   "engine"
    t.string   "fuel_on_city"
    t.float    "daily_rental"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.integer  "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_cities_on_state_id", using: :btree
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "devices", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "os"
    t.string   "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "token"], name: "index_devices_on_user_id_and_token", unique: true, using: :btree
    t.index ["user_id"], name: "index_devices_on_user_id", using: :btree
  end

  create_table "flights", force: :cascade do |t|
    t.string   "status"
    t.string   "number"
    t.string   "origin_airport_code"
    t.string   "destination_airport_code"
    t.string   "origin"
    t.string   "destination"
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "actual_start_at"
    t.datetime "actual_end_at"
    t.text     "logs"
    t.integer  "jet_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["jet_id"], name: "index_flights_on_jet_id", using: :btree
  end

  create_table "jets", force: :cascade do |t|
    t.string   "type"
    t.string   "brand"
    t.string   "model"
    t.text     "description"
    t.string   "classification"
    t.integer  "seats"
    t.integer  "range"
    t.integer  "luggage_capacity"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "locations", force: :cascade do |t|
    t.float    "lat"
    t.float    "lng"
    t.float    "distance"
    t.string   "address"
    t.integer  "city_id"
    t.integer  "state_id"
    t.integer  "country_id"
    t.string   "locatable_type"
    t.integer  "locatable_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["city_id"], name: "index_locations_on_city_id", using: :btree
    t.index ["country_id"], name: "index_locations_on_country_id", using: :btree
    t.index ["lat", "lng"], name: "index_locations_on_lat_and_lng", using: :btree
    t.index ["locatable_type", "locatable_id"], name: "index_locations_on_locatable_type_and_locatable_id", using: :btree
    t.index ["state_id"], name: "index_locations_on_state_id", using: :btree
  end

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.json     "tokens"
    t.string   "role",                   default: "user",  null: false
    t.string   "name"
    t.string   "surname"
    t.string   "company_name"
    t.string   "organisation"
    t.string   "website"
    t.string   "phone"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree
  end

  create_table "yatches", force: :cascade do |t|
    t.string   "type"
    t.string   "brand"
    t.string   "model"
    t.text     "description"
    t.string   "classification"
    t.integer  "seats"
    t.integer  "range"
    t.integer  "luggage_capacity"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_foreign_key "cities", "states"
  add_foreign_key "devices", "users"
end
