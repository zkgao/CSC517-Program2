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

ActiveRecord::Schema.define(version: 2018_09_27_223612) do

  create_table "admins", primary_key: "email", force: :cascade do |t|
    t.string "encrypted_password", default: "", null: false
    t.string "name", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
  end

  create_table "houses", force: :cascade do |t|
    t.string "Location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "real_estate_companies", primary_key: "Id", force: :cascade do |t|
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

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
