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

ActiveRecord::Schema.define(:version => 20121015025333) do

  create_table "things", :force => true do |t|
    t.string   "description"
    t.integer  "vote_code",                     :null => false
    t.boolean  "active",      :default => true
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "things", ["vote_code"], :name => "index_things_on_vote_code"

  create_table "users", :force => true do |t|
    t.integer  "phone",      :limit => 15,                    :null => false
    t.boolean  "opt_in",                   :default => false
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
  end

  add_index "users", ["phone"], :name => "index_users_on_phone"

  create_table "votes", :force => true do |t|
    t.datetime "voted_at"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "votes", ["user_id"], :name => "index_votes_on_user_id"

end
