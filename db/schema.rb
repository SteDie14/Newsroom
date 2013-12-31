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

ActiveRecord::Schema.define(version: 20131231190151) do

  create_table "accounts", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "expenses", force: true do |t|
    t.string   "title"
    t.decimal  "amount",          precision: 10, scale: 0
    t.integer  "tax_rate"
    t.date     "accounting_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "folders", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ancestry"
    t.integer  "user_id"
  end

  add_index "folders", ["ancestry"], name: "index_folders_on_ancestry", using: :btree

  create_table "folders_news_items", force: true do |t|
    t.integer "folder_id"
    t.integer "news_item_id"
  end

  create_table "incomes", force: true do |t|
    t.string   "title"
    t.decimal  "amount",          precision: 10, scale: 0
    t.date     "accounting_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news_items", force: true do |t|
    t.date     "release_date"
    t.string   "vendor"
    t.string   "headline"
    t.string   "topic"
    t.string   "keywords"
    t.text     "web_url"
    t.string   "doc_url"
    t.text     "comment"
    t.integer  "rss_source_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "guid"
    t.text     "summary"
    t.integer  "tag_contra_id"
    t.integer  "tag_pro_id"
    t.integer  "user_id"
  end

  create_table "rss_sources", force: true do |t|
    t.string   "title"
    t.text     "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "tag_contras", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "tag_pros", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
