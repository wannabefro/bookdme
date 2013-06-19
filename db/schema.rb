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

ActiveRecord::Schema.define(:version => 20130619175201) do

  create_table "acts", :force => true do |t|
    t.integer  "user_id",      :null => false
    t.string   "name"
    t.integer  "location_id",  :null => false
    t.string   "custom_genre"
    t.text     "biography"
    t.string   "avatar"
    t.text     "rider"
    t.integer  "travel_range"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "website"
    t.integer  "category_id",  :null => false
    t.string   "short_bio"
    t.integer  "price_id"
  end

  add_index "acts", ["user_id"], :name => "index_acts_on_user_id", :unique => true

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "locations", :force => true do |t|
    t.string   "state"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "prices", :force => true do |t|
    t.string   "range"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "proposals", :force => true do |t|
    t.integer  "act_id",     :null => false
    t.integer  "user_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "price",      :null => false
    t.text     "proposal",   :null => false
    t.date     "date",       :null => false
    t.time     "time",       :null => false
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "first_name",                             :null => false
    t.string   "last_name",                              :null => false
    t.string   "unconfirmed_email"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "venues", :force => true do |t|
    t.integer  "location_id", :null => false
    t.integer  "user_id",     :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "capacity",    :null => false
    t.string   "city",        :null => false
    t.string   "kind"
    t.string   "zipcode"
  end

end
