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

ActiveRecord::Schema.define(version: 20150311203805) do

  create_table "boats", force: :cascade do |t|
    t.string   "image_url",                limit: 255
    t.string   "name",                     limit: 255
    t.string   "make",                     limit: 255
    t.integer  "size",                     limit: 4
    t.integer  "shares_possible",          limit: 4
    t.decimal  "full_share_price",                     precision: 6, scale: 2
    t.decimal  "two_thirds_share_price",               precision: 6, scale: 2
    t.datetime "created_at",                                                   null: false
    t.datetime "updated_at",                                                   null: false
    t.string   "harbor",                   limit: 255
    t.decimal  "two_thirds_price",                     precision: 7, scale: 2
    t.integer  "half_credit_AM_MTWTh",     limit: 4
    t.integer  "half_credit_PM_MTWTh",     limit: 4
    t.integer  "half_credit_AM_F",         limit: 4
    t.integer  "half_credit_PM_F",         limit: 4
    t.integer  "half_credit_AM_SAT",       limit: 4
    t.integer  "half_credit_PM_SAT",       limit: 4
    t.integer  "half_credit_AM_SUN",       limit: 4
    t.integer  "half_credit_PM_SUN",       limit: 4
    t.integer  "full_credit_MTWTh",        limit: 4
    t.integer  "full_credit_F",            limit: 4
    t.integer  "full_credit_SAT",          limit: 4
    t.integer  "full_credit_SUN",          limit: 4
    t.string   "type",                     limit: 255
    t.integer  "two_thirds_credits_total", limit: 4
    t.integer  "full_credits_total",       limit: 4
  end

  create_table "share_options", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
