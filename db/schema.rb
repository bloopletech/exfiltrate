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

ActiveRecord::Schema.define(version: 20150829104340) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blobs", force: :cascade do |t|
    t.integer  "site_id"
    t.text     "url"
    t.text     "aasm_state"
    t.json     "request_headers"
    t.text     "request_body"
    t.integer  "response_code"
    t.json     "response_headers"
    t.text     "response_body_id"
    t.datetime "requested_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "refile_attachments", force: :cascade do |t|
    t.string "namespace", null: false
  end

  add_index "refile_attachments", ["namespace"], name: "index_refile_attachments_on_namespace", using: :btree

  create_table "sites", force: :cascade do |t|
    t.text     "name"
    t.text     "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
