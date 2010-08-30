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

ActiveRecord::Schema.define(:version => 20100830205450) do

  create_table "note_item_statuses", :force => true do |t|
    t.integer  "note_id"
    t.integer  "visitor_id"
    t.string   "item_id"
    t.boolean  "status",     :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "note_item_statuses", ["note_id", "visitor_id"], :name => "index_note_item_statuses_on_note_id_and_visitor_id"

  create_table "notes", :force => true do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.boolean  "public",     :default => true
  end

  add_index "notes", ["created_at"], :name => "index_notes_on_created_at"
  add_index "notes", ["public"], :name => "index_notes_on_public"
  add_index "notes", ["user_id"], :name => "index_notes_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "full_name",                          :null => false
    t.string   "email",                              :null => false
    t.string   "crypted_password",                   :null => false
    t.string   "password_salt",                      :null => false
    t.string   "persistence_token",                  :null => false
    t.string   "single_access_token",                :null => false
    t.string   "perishable_token",                   :null => false
    t.integer  "login_count",         :default => 0, :null => false
    t.integer  "failed_login_count",  :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "visitors", :force => true do |t|
    t.string   "cookie_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "visitors", ["cookie_id"], :name => "index_visitors_on_cookie_id"

end
