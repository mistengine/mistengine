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

ActiveRecord::Schema.define(version: 20140107035846) do

  create_table "articles", force: true do |t|
    t.string   "title"
    t.string   "blurb"
    t.text     "text"
    t.integer  "settings"
    t.string   "type"
    t.datetime "published_at"
    t.integer  "review_score"
    t.text     "sidebar"
    t.integer  "original_id"
    t.string   "byline"
    t.integer  "comment_count"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "published"
    t.boolean  "allow_comments"
  end

  add_index "articles", ["allow_comments"], name: "index_articles_on_allow_comments", using: :btree
  add_index "articles", ["published"], name: "index_articles_on_published", using: :btree

end
