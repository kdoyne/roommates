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

ActiveRecord::Schema.define(version: 20140407230644) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bills", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "due_date"
    t.integer  "house_id"
    t.decimal  "amount",     precision: 8, scale: 2
    t.decimal  "split",      precision: 8, scale: 2
  end

  create_table "events", force: true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.integer  "house_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date"
    t.string   "time"
  end

  create_table "houses", force: true do |t|
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "passcode"
  end

  create_table "reminders", force: true do |t|
    t.integer  "event_id"
    t.string   "message"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date"
    t.time     "time"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "house_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone_number"
  end

end
