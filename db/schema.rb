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

ActiveRecord::Schema.define(version: 20131208180122) do

  create_table "folders", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ancestry"
  end

  add_index "folders", ["ancestry"], name: "index_folders_on_ancestry", using: :btree

  create_table "folders_news_items", force: true do |t|
    t.integer "folder_id"
    t.integer "news_item_id"
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
  end

  create_table "rss_sources", force: true do |t|
    t.string   "title"
    t.text     "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tag_contras", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tag_pros", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
