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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130715152135) do

  create_table "bookings", :force => true do |t|
    t.integer  "event_id"
    t.integer  "location_id"
    t.date     "booking_date"
    t.string   "time_slot"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "bookings", ["event_id"], :name => "index_bookings_on_event_id"
  add_index "bookings", ["location_id"], :name => "index_bookings_on_location_id"

  create_table "enrolments", :force => true do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.date     "enrolment_date"
    t.string   "payment_status"
    t.string   "enrolment_status"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "enrolments", ["event_id"], :name => "index_enrolments_on_event_id"
  add_index "enrolments", ["user_id"], :name => "index_enrolments_on_user_id"

  create_table "events", :force => true do |t|
    t.string   "name"
    t.string   "price"
    t.string   "event_image"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.string   "capacity"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "role"
    t.string   "profile_image"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
