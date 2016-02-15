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

ActiveRecord::Schema.define(version: 20160211202503) do

  create_table "channels", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "protocols", force: :cascade do |t|
    t.string   "customer_login"
    t.integer  "channel_id"
    t.string   "conversation_id"
    t.string   "phone"
    t.string   "status"
    t.date     "in_progress_at"
    t.date     "finalized_at"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "protocols", ["channel_id"], name: "index_protocols_on_channel_id"

  create_table "user_channels", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "channel_id"
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_channels", ["channel_id"], name: "index_user_channels_on_channel_id"
  add_index "user_channels", ["user_id"], name: "index_user_channels_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "login"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
