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

ActiveRecord::Schema.define(version: 20161211225525) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bets", force: :cascade do |t|
    t.datetime "executed"
    t.integer  "user_id"
    t.integer  "match_id",                       null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.boolean  "bet_on_local",   default: false, null: false
    t.boolean  "bet_on_visitor", default: false, null: false
    t.boolean  "bet_on_tie",     default: false, null: false
    t.integer  "amount"
  end

  add_index "bets", ["match_id"], name: "index_bets_on_match_id", using: :btree
  add_index "bets", ["user_id"], name: "index_bets_on_user_id", using: :btree

  create_table "complete_bets", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "first_bet_id"
    t.integer  "second_bet_id"
    t.integer  "third_bet_id"
    t.float    "amount"
    t.integer  "user_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "match_results", force: :cascade do |t|
    t.integer  "winner"
    t.integer  "match_id",                   null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "accepted",   default: false, null: false
  end

  add_index "match_results", ["match_id"], name: "index_match_results_on_match_id", using: :btree

  create_table "matches", force: :cascade do |t|
    t.datetime "time"
    t.float    "local_ratio"
    t.float    "visitor_ratio"
    t.float    "tie_ratio"
    t.integer  "local_team_id"
    t.integer  "visitor_team_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "accepted",        default: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "country_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "is_admin",               default: false, null: false
    t.string   "last_name"
    t.datetime "birthday"
    t.string   "address"
    t.integer  "phone_number"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "bets", "matches"
  add_foreign_key "bets", "users"
  add_foreign_key "complete_bets", "bets", column: "first_bet_id"
  add_foreign_key "complete_bets", "bets", column: "second_bet_id"
  add_foreign_key "complete_bets", "bets", column: "third_bet_id"
  add_foreign_key "complete_bets", "users"
  add_foreign_key "match_results", "matches"
  add_foreign_key "matches", "teams", column: "local_team_id"
  add_foreign_key "matches", "teams", column: "visitor_team_id"
  add_foreign_key "teams", "countries"
end
