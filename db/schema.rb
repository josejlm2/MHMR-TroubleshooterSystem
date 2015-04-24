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

ActiveRecord::Schema.define(:version => 20150424122932) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "emails", :force => true do |t|
    t.string   "email_address"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "locations", :force => true do |t|
    t.string "name"
  end

  create_table "ticket_categories", :force => true do |t|
    t.string "name"
  end

  create_table "tickets", :force => true do |t|
    t.string  "requestor"
    t.string  "phone"
    t.integer "ru"
    t.string  "email"
    t.string  "room"
    t.string  "subject"
    t.text    "description"
    t.integer "location_id"
    t.integer "ticket_category_id"
    t.string  "status"
  end

end
