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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_09_23_232316) do

  create_table "admins", primary_key: "email", force: :cascade do |t|
    t.string "encrypted_password", default: "", null: false
    t.string "name", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
  end

  create_table "real_estate_companies", force: :cascade do |t|
    t.string "Name"
    t.string "Webstie"
    t.string "Address"
    t.string "Size"
    t.string "Founded"
    t.string "Revenue"
    t.string "Synopsis"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
