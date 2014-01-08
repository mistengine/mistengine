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

ActiveRecord::Schema.define(version: 20140107142928) do

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

  create_table "authors", force: true do |t|
    t.integer  "user_id"
    t.integer  "article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authors", ["article_id"], name: "index_authors_on_article_id", using: :btree
  add_index "authors", ["user_id"], name: "index_authors_on_user_id", using: :btree

  create_table "group_members", force: true do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "group_members", ["group_id"], name: "index_group_members_on_group_id", using: :btree
  add_index "group_members", ["user_id"], name: "index_group_members_on_user_id", using: :btree

  create_table "groups", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.text     "permissions"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.boolean  "active"
    t.text     "blurb"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["active"], name: "index_users_on_active", using: :btree

end
