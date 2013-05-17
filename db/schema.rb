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

ActiveRecord::Schema.define(:version => 20130408154027) do

  create_table "displays", :force => true do |t|
    t.string   "col1"
    t.string   "col2"
    t.string   "col3"
    t.string   "col4"
    t.string   "col5"
    t.string   "col6"
    t.string   "col7"
    t.string   "col8"
    t.string   "col9"
    t.string   "col10"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "scrapers", :force => true do |t|
    t.string   "usr_name"
    t.string   "usr_password"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end
