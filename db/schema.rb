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

ActiveRecord::Schema.define(version: 20170410101908) do

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

  create_table "car_bookings", force: :cascade do |t|
    t.integer  "car_id"
    t.integer  "user_id"
    t.integer  "city_id"
    t.integer  "country_id"
    t.boolean  "chauffeur",                default: false
    t.string   "status"
    t.string   "pick_up_address"
    t.string   "pick_up_lat"
    t.string   "pick_up_lng"
    t.datetime "pick_up_time"
    t.datetime "arrival_time"
    t.string   "destination_address"
    t.string   "destination_lat"
    t.string   "destination_lng"
    t.float    "estimate_distance"
    t.float    "estimate_price"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "name"
    t.string   "surname"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "driver_licence"
    t.datetime "bithrday"
    t.datetime "start_date"
    t.datetime "end_date"
    t.text     "additional_information"
    t.string   "state_license_was_issued"
    t.string   "insurance_carrier"
    t.string   "policy"
    t.index ["car_id"], name: "index_car_bookings_on_car_id", using: :btree
    t.index ["city_id"], name: "index_car_bookings_on_city_id", using: :btree
    t.index ["country_id"], name: "index_car_bookings_on_country_id", using: :btree
    t.index ["user_id"], name: "index_car_bookings_on_user_id", using: :btree
  end

  create_table "cars", force: :cascade do |t|
    t.string   "type"
    t.string   "brand"
    t.string   "model"
    t.text     "description"
    t.integer  "seats"
    t.integer  "power"
    t.integer  "top_speed"
    t.string   "engine"
    t.integer  "fuel_on_city"
    t.integer  "fuel_on_hightway"
    t.float    "daily_rental"
    t.float    "price_per_miles"
    t.float    "deposit"
    t.integer  "daily_miles"
    t.integer  "extra_price_per_mile"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "cars_cities", id: false, force: :cascade do |t|
    t.integer "car_id",  null: false
    t.integer "city_id", null: false
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

  create_table "jet_bookings", force: :cascade do |t|
    t.string   "departure_city"
    t.string   "arrival_city"
    t.datetime "departure_date"
    t.datetime "return_date"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "user_id"
    t.integer  "jet_id"
    t.integer  "passengers"
  end

  create_table "jet_types", force: :cascade do |t|
    t.string   "name"
    t.string   "short_name"
    t.text     "description"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
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
    t.float    "price_per_hours"
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
    t.string   "nickname"
    t.string   "company_name"
    t.string   "organisation"
    t.string   "website"
    t.string   "phone"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.index ["email", "provider"], name: "index_users_on_email_and_provider", unique: true, using: :btree
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
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

  add_foreign_key "car_bookings", "cars"
  add_foreign_key "car_bookings", "users"
  add_foreign_key "cities", "states"
  add_foreign_key "devices", "users"
end
