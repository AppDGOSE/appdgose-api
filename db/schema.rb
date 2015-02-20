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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140326203257) do

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "account_number",         default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["account_number"], name: "index_users_on_account_number", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "vw_events", force: true do |t|
    t.integer "id_event",                    null: false
    t.string  "name_event"
    t.string  "date_event_start", limit: 50
    t.string  "date_event_end",   limit: 50
    t.string  "place_event"
    t.string  "url_event"
    t.string  "alias_event",      limit: 15
    t.string  "status_event",     limit: 1     
  end

  create_table "vw_info_becario", force: true do |t|
    t.string  "cuenta",           limit: 9,  null: false
    t.string  "last_name_pat",    limit: 30
    t.string  "last_name_mat",    limit: 30
    t.string  "first_name",       limit: 30
    t.string  "email_unam",       limit: 75
    t.string  "email_comercial", limit: 75
    t.string  "curp",             limit: 18
    t.string  "direct_phone",     limit: 15
    t.string  "mobile_phone",     limit: 15
    t.integer "code_school"
    t.string  "desc_code_school", limit: 100
    t.integer "code_major"
    t.string  "desc_code_major",  limit: 100
    t.string  "code_bank",        limit: 20
    t.string  "desc_code_bank",   limit: 20
    t.string  "bank_acct",        limit: 16
    t.integer "code_prog_beca"
    t.string  "desc_code_prog_beca", limit: 50
    t.integer "status_beca"
    t.string  "desc_status_beca", limit: 150
    t.string  "current_cicle",    limit: 10
  end

  add_index "vw_info_becario", ["cuenta"], name: "index_vw_info_becario_on_cuenta", unique: true

  create_table "vw_login", force: true do |t|
    t.string "cuenta",     limit: 9, null: false
    t.string "birth_date", limit: 8, null: false
  end

  add_index "vw_login", ["cuenta"], name: "index_on_vw_login_on_cuenta", unique: true

  create_table "vw_payments", force: true do |t|
    t.string  "cuenta", limit: 9, null: false
    t.integer "jan"
    t.string  "date_jan", limit: 30
    t.integer "feb"
    t.string  "date_feb", limit: 30
    t.integer "march"
    t.string  "date_march", limit: 30
    t.integer "april"
    t.string  "date_april", limit: 30
    t.integer "may"
    t.string  "date_may", limit: 30
    t.integer "june"
    t.string  "date_june", limit: 30
    t.integer "jul"
    t.string  "date_jul", limit: 30
    t.integer "aug"
    t.string  "date_aug", limit: 30
    t.integer "sep"
    t.string  "date_sep", limit: 30
    t.integer "oct"
    t.string  "date_oct", limit: 30
    t.integer "nov"
    t.string  "date_nov", limit: 30
    t.integer "dec"
    t.string  "date_dec", limit: 30
    t.string  "current_cicle", limit: 10
  end

  add_index "vw_payments", ["cuenta"], name: "index_vw_payments_on_cuenta", unique: true
  
end
