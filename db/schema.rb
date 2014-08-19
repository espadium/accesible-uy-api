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

ActiveRecord::Schema.define(version: 20140730040053) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", force: true do |t|
    t.string   "token"
    t.string   "email"
    t.string   "domain_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "places", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.integer  "author_id"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "places", ["author_id"], name: "index_places_on_author_id", using: :btree
  add_index "places", ["client_id"], name: "index_places_on_client_id", using: :btree

  create_table "votes", force: true do |t|
    t.integer  "author_id"
    t.integer  "place_id"
    t.boolean  "accurate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["author_id"], name: "index_votes_on_author_id", using: :btree
  add_index "votes", ["place_id"], name: "index_votes_on_place_id", using: :btree

end
