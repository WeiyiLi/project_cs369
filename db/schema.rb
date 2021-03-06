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

ActiveRecord::Schema.define(version: 20140513000608) do

  create_table "comments", force: true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "episode_id"
  end

  add_index "comments", ["episode_id", "created_at"], name: "index_comments_on_episode_id_and_created_at"
  add_index "comments", ["user_id", "created_at"], name: "index_comments_on_user_id_and_created_at"

  create_table "episodes", force: true do |t|
    t.integer  "series_id"
    t.integer  "season"
    t.integer  "number"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "episodes", ["series_id", "season", "number"], name: "index_episodes_on_series_id_and_season_and_number"

  create_table "series", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "series", ["name"], name: "index_series_on_name", unique: true

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

  create_table "watchlists", force: true do |t|
    t.integer  "follower_id"
    t.integer  "series_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "watchlists", ["follower_id", "series_id"], name: "index_watchlists_on_follower_id_and_series_id", unique: true
  add_index "watchlists", ["follower_id"], name: "index_watchlists_on_follower_id"
  add_index "watchlists", ["series_id"], name: "index_watchlists_on_series_id"

end
