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

ActiveRecord::Schema.define(:version => 20111003222109) do

  create_table "club_pro_relationships", :force => true do |t|
    t.integer  "club_id"
    t.integer  "pro_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "club_pro_relationships", ["club_id", "pro_id"], :name => "index_club_pro_relationships_on_club_id_and_pro_id", :unique => true
  add_index "club_pro_relationships", ["club_id"], :name => "index_club_pro_relationships_on_club_id"
  add_index "club_pro_relationships", ["pro_id"], :name => "index_club_pro_relationships_on_pro_id"

  create_table "clubs", :force => true do |t|
    t.string   "name"
    t.integer  "owner_id"
    t.text     "bio"
    t.text     "contact_info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "pro",                :default => false
    t.boolean  "admin",              :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
