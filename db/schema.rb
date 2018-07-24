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

ActiveRecord::Schema.define(version: 20180712024609) do

  create_table "group_events", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.text "description", default: ""
    t.integer "number_days", default: 0
    t.integer "duration", default: 0
    t.string "location", default: ""
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean "published", default: false, null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_group_events_on_deleted_at"
  end

end
