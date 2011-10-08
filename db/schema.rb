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

ActiveRecord::Schema.define(:version => 20110908172001) do

  create_table "anniversaries", :force => true do |t|
    t.integer  "celebrity_id"
    t.string   "anniversary_type"
    t.datetime "anniversary_date"
    t.text     "message"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "celebrities", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "other_names"
    t.string   "sex",           :limit => 0,                         :null => false
    t.string   "primary_email"
    t.string   "other_emails"
    t.string   "mobile"
    t.string   "status",                     :default => "disabled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "menus", :force => true do |t|
    t.string   "name"
    t.integer  "order",      :null => false
    t.string   "alias"
    t.string   "perma_link"
    t.string   "route"
    t.integer  "parent"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", :force => true do |t|
    t.string   "anniversary_type"
    t.string   "message_type"
    t.text     "message"
    t.string   "status"
    t.integer  "maker"
    t.integer  "checker"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuses", :force => true do |t|
    t.string   "object_type"
    t.string   "db_name"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
