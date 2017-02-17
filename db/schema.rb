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

ActiveRecord::Schema.define(version: 20170215078499) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cars", force: :cascade do |t|
    t.string   "car_type"
    t.string   "brand_name"
    t.string   "model_name"
    t.text     "description"
    t.integer  "seats"
    t.integer  "power"
    t.integer  "max_speed"
    t.string   "engine"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
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

  create_table "jets", force: :cascade do |t|
    t.string   "jet_type"
    t.string   "brand_name"
    t.string   "model_name"
    t.text     "description"
    t.string   "classification"
    t.integer  "seats"
    t.integer  "range"
    t.integer  "luggage_capacity"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
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
    t.string   "yatch_type"
    t.string   "brand_name"
    t.string   "model_name"
    t.text     "description"
    t.string   "classification"
    t.integer  "seats"
    t.integer  "range"
    t.integer  "luggage_capacity"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_foreign_key "devices", "users"
end
