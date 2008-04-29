# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20080429185854) do

  create_table "accounts", :force => true do |t|
    t.string   "username",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "param"
    t.string   "avatar_url"
  end

  create_table "todos", :force => true do |t|
    t.integer  "account_id"
    t.string   "description", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tweet_id"
    t.datetime "tweet_time"
  end

end
