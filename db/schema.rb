# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100628045044) do

  create_table "cars", :force => true do |t|
    t.integer "make_id", :null => false
    t.string  "name"
    t.string  "year"
  end

  create_table "comments", :force => true do |t|
    t.integer "user_id", :null => false
    t.integer "post_id", :null => false
    t.string  "body"
  end

  create_table "dealers", :force => true do |t|
    t.string "name",     :limit => 100
    t.string "address",  :limit => 300
    t.string "city",     :limit => 50
    t.string "province", :limit => 70
    t.string "zip",      :limit => 10
    t.string "phone",    :limit => 15
    t.string "url",      :limit => 600
  end

  create_table "makes", :force => true do |t|
    t.string "name"
  end

  create_table "posts", :force => true do |t|
    t.integer "user_id",                                    :null => false
    t.integer "car_id",                                     :null => false
    t.integer "dealer_id",                                  :null => false
    t.decimal "price_paid",  :precision => 16, :scale => 2, :null => false
    t.string  "description"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string "username"
    t.string "hashed_password"
    t.string "salt"
    t.string "firstname"
    t.string "lastname"
    t.string "email"
  end

end
