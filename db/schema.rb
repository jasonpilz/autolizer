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

ActiveRecord::Schema.define(version: 20160120211539) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "trips", force: :cascade do |t|
    t.decimal  "average_kmpl"
    t.integer  "vehicle_id"
    t.string   "vehicle_url"
    t.datetime "started_at"
    t.string   "start_timezone"
    t.decimal  "average_from_epa_kmpl"
    t.decimal  "fuel_cost_usd"
    t.decimal  "fuel_volume_l"
    t.string   "tid"
    t.decimal  "distance_m"
    t.datetime "ended_at"
    t.string   "end_timezone"
    t.string   "user_url"
    t.integer  "idling_time_s"
    t.decimal  "duration_s"
    t.string   "path"
    t.string   "start_address"
    t.string   "end_address"
    t.decimal  "start_lon"
    t.decimal  "start_lat"
    t.decimal  "end_lon"
    t.decimal  "end_lat"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "trips", ["vehicle_id"], name: "index_trips_on_vehicle_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "oauth_access_token"
    t.string   "uid"
    t.integer  "token_expires_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.string   "vid"
    t.string   "url"
    t.string   "make"
    t.string   "model"
    t.string   "vin"
    t.string   "submodel"
    t.integer  "year"
    t.string   "fuel_grade"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "vehicles", ["user_id"], name: "index_vehicles_on_user_id", using: :btree

  add_foreign_key "trips", "vehicles"
  add_foreign_key "vehicles", "users"
end
