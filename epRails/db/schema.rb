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

ActiveRecord::Schema.define(version: 20140917105417) do

  create_table "cores", force: true do |t|
    t.string   "hexid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cores", ["hexid"], name: "index_cores_on_hexid", unique: true

  create_table "wibean_event_v1s", force: true do |t|
    t.string   "name"
    t.string   "data"
    t.integer  "ttl"
    t.datetime "published_at"
    t.string   "hexid"
    t.integer  "core_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
