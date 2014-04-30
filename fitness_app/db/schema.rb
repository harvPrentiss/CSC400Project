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

ActiveRecord::Schema.define(version: 20140428184800) do

  create_table "exercise_routines", force: true do |t|
    t.integer  "exercise_id"
    t.integer  "routine_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "exercise_routines", ["exercise_id", "routine_id"], name: "index_exercise_routines_on_exercise_id_and_routine_id", unique: true
  add_index "exercise_routines", ["exercise_id"], name: "index_exercise_routines_on_exercise_id"
  add_index "exercise_routines", ["routine_id"], name: "index_exercise_routines_on_routine_id"

  create_table "exercises", force: true do |t|
    t.integer  "user_id"
    t.string   "E_title"
    t.string   "E_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "programs", force: true do |t|
    t.integer  "routine_id"
    t.integer  "exercise_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relationships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "routines", force: true do |t|
    t.integer  "user_id"
    t.string   "R_title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuses", force: true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "displayName"
    t.string   "password"
    t.string   "emailAdd"
    t.string   "profileImgURL"
    t.integer  "heightM"
    t.integer  "weightM"
    t.integer  "bodyFatM"
    t.integer  "armsM"
    t.integer  "forearmsM"
    t.integer  "waistM"
    t.integer  "chestM"
    t.integer  "thighsM"
    t.integer  "calvesM"
    t.integer  "shouldersM"
    t.integer  "neckM"
    t.boolean  "hideStats"
    t.boolean  "hideWorkouts"
    t.boolean  "hideSoundtrack"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
    t.string   "song1"
    t.string   "song2"
    t.string   "song3"
    t.string   "song4"
    t.string   "song5"
    t.string   "artist1"
    t.string   "artist2"
    t.string   "artist3"
    t.string   "artist4"
    t.string   "artist5"
  end

  add_index "users", ["emailAdd"], name: "index_users_on_emailAdd", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

  create_table "workouts", force: true do |t|
    t.integer  "user_id"
    t.integer  "W_reps"
    t.float    "W_weight"
    t.integer  "W_sets"
    t.float    "W_distance"
    t.time     "W_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "notes"
    t.integer  "exercise_id"
  end

end
