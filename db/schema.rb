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

ActiveRecord::Schema.define(version: 20151027132845) do

  create_table "categories", force: :cascade do |t|
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "entries", force: :cascade do |t|
    t.string   "entry",             limit: 255
    t.text     "description",       limit: 65535
    t.text     "funny_description", limit: 65535
    t.text     "picture",           limit: 65535
    t.integer  "category_id",       limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "entries", ["category_id"], name: "fk_rails_b4563fe89e", using: :btree

  create_table "entries_tags", id: false, force: :cascade do |t|
    t.integer "entry_id", limit: 4
    t.integer "tag_id",   limit: 4
  end

  add_index "entries_tags", ["entry_id"], name: "index_entries_tags_on_entry_id", using: :btree
  add_index "entries_tags", ["tag_id"], name: "index_entries_tags_on_tag_id", using: :btree

  create_table "suggestions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "email",           limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "password_digest", limit: 255
  end

  add_foreign_key "entries", "categories"
end
