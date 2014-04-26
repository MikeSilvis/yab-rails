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

ActiveRecord::Schema.define(version: 20140426144751) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "checkins", force: true do |t|
    t.integer  "location_id"
    t.integer  "merchant_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "levels", force: true do |t|
    t.integer  "points"
    t.string   "name"
    t.string   "avatar_uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "latitude",    precision: 15, scale: 10
    t.decimal  "longitude",   precision: 15, scale: 10
    t.string   "street"
    t.string   "state"
    t.integer  "zipcode"
    t.string   "city"
    t.integer  "market_id"
    t.string   "uuid"
    t.string   "identifier"
    t.string   "major"
    t.string   "minor"
    t.integer  "merchant_id"
    t.string   "message"
  end

  create_table "markets", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.hstore   "preferences"
  end

  add_index "markets", ["preferences"], name: "index_markets_on_preferences", using: :gist

  create_table "merchants", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "aasm_state", default: "demand_generation"
    t.string   "avatar_uid"
    t.integer  "user_id"
  end

  create_table "rewards", force: true do |t|
    t.integer  "points"
    t.string   "name"
    t.integer  "merchant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_rewards", force: true do |t|
    t.integer  "user_id"
    t.integer  "reward_id"
    t.integer  "merchant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "checkins_count", default: 0
  end

  create_table "users", force: true do |t|
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
    t.string   "phone_number"
    t.string   "name"
    t.boolean  "beta"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "birthday"
    t.string   "gender"
    t.string   "facebook_id"
    t.string   "authentication_token"
    t.boolean  "admin"
    t.integer  "market_id"
    t.integer  "merchant_id"
    t.string   "profile_photo_uid"
    t.string   "cover_photo_uid"
    t.integer  "current_level_id"
    t.integer  "next_level_id"
    t.integer  "checkins_count",         default: 0
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
