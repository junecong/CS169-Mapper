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

ActiveRecord::Schema.define(version: 20151124013548) do

  create_table "columns", force: :cascade do |t|
    t.integer  "dataset_id"
    t.string   "name"
    t.string   "column_type"
    t.string   "null_value"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "location_type"
    t.string   "description"
    t.string   "friendly_name"
    t.string   "detail_level"
  end

  add_index "columns", ["dataset_id"], name: "index_columns_on_dataset_id"

  create_table "datasets", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "filepath"
    t.integer  "num_rows"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "is_public"
  end

  add_index "datasets", ["user_id"], name: "index_datasets_on_user_id"

  create_table "maps", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "dataset_id"
    t.string   "name"
    t.string   "shareable_url"
    t.string   "display_variable"
    t.string   "filter_variable"
    t.string   "styling"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.boolean  "is_example"
  end

  add_index "maps", ["dataset_id"], name: "index_maps_on_dataset_id"
  add_index "maps", ["shareable_url"], name: "index_maps_on_shareable_url"
  add_index "maps", ["user_id"], name: "index_maps_on_user_id"

  create_table "user_input_data", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "nickname"
    t.string   "image"
    t.string   "email",                  default: "",      null: false
    t.text     "tokens"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true

end
