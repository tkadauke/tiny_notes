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

ActiveRecord::Schema.define(:version => 20100819200720) do

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
  end

  add_index "notes", ["created_at"], :name => "index_notes_on_created_at"

  create_table "visitors", :force => true do |t|
    t.string   "cookie_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "visitors", ["cookie_id"], :name => "index_visitors_on_cookie_id"

end
