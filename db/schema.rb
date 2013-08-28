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

ActiveRecord::Schema.define(version: 20130828111916) do

  create_table "news_items", force: true do |t|
    t.date     "release_date"
    t.string   "vendor"
    t.string   "headline"
    t.string   "topic"
    t.string   "keywords"
    t.string   "web_url"
    t.string   "doc_url"
    t.text     "comment"
    t.integer  "RssSource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "news_items", ["RssSource_id"], name: "index_news_items_on_RssSource_id", using: :btree

  create_table "rss_sources", force: true do |t|
    t.string   "title"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
