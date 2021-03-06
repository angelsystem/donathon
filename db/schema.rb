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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20151122054756) do
=======
ActiveRecord::Schema.define(version: 20151122052956) do
>>>>>>> 2689882a4eecab0b103b6753b56e2ec4978c607e

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaigns", force: :cascade do |t|
    t.string   "title"
    t.string   "beneficiary"
    t.text     "description"
    t.string   "logo"
    t.integer  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "deliveries", force: :cascade do |t|
    t.float    "latitude"
    t.float    "longitude"
    t.string   "address"
    t.string   "district"
    t.integer  "user_id"
    t.integer  "donation_id"
    t.integer  "transport_method_id"
    t.integer  "status",              default: 0
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "donations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "campaign_id"
    t.string   "title"
    t.text     "description"
    t.string   "picture"
    t.integer  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "donations", ["campaign_id"], name: "index_donations_on_campaign_id", using: :btree
  add_index "donations", ["user_id"], name: "index_donations_on_user_id", using: :btree

  create_table "transport_methods", force: :cascade do |t|
    t.string   "name"
    t.text     "instruction"
    t.integer  "status",      default: 0
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "avatar"
    t.string   "status"
    t.string   "provider"
    t.string   "oauth_token"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "type"
  end

  add_foreign_key "donations", "campaigns"
  add_foreign_key "donations", "users"
end
