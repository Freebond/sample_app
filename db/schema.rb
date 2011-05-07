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

ActiveRecord::Schema.define(:version => 20110505204120) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "duns"
    t.string   "address"
    t.string   "city"
    t.string   "zip"
    t.string   "province"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "whitelist"
    t.boolean  "blacklist"
  end

  create_table "cpyrelationships", :force => true do |t|
    t.integer  "cpyfollower_id"
    t.integer  "cpyfollowed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cpyrelationships", ["cpyfollowed_id"], :name => "index_cpyrelationships_on_cpyfollowed_id"
  add_index "cpyrelationships", ["cpyfollower_id", "cpyfollowed_id"], :name => "index_cpyrelationships_on_cpyfollower_id_and_cpyfollowed_id", :unique => true
  add_index "cpyrelationships", ["cpyfollower_id"], :name => "index_cpyrelationships_on_cpyfollower_id"

  create_table "imports", :force => true do |t|
    t.string   "datatype"
    t.integer  "processed",        :default => 0
    t.string   "csv_file_name"
    t.string   "csv_content_type"
    t.integer  "csv_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "microposts", :force => true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "microposts", ["user_id"], :name => "index_microposts_on_user_id"

  create_table "relationships", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], :name => "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], :name => "index_relationships_on_follower_id_and_followed_id", :unique => true
  add_index "relationships", ["follower_id"], :name => "index_relationships_on_follower_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
    t.boolean  "admin"
    t.integer  "company_id"
  end

end
