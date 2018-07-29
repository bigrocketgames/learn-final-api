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

ActiveRecord::Schema.define(version: 20180729023244) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chat_rooms", force: :cascade do |t|
    t.string "roomName"
    t.integer "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conferences", force: :cascade do |t|
    t.string "name"
    t.integer "sub_sport_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", id: :serial, force: :cascade do |t|
    t.datetime "game_time"
    t.integer "home_team_id"
    t.integer "away_team_id"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "season_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.integer "chat_room_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seasons", force: :cascade do |t|
    t.string "year"
    t.string "alt_display"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sports", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sub_sports", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "sport_id"
    t.boolean "conference_split"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "alt_season_display"
  end

  create_table "teams", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "mascot"
    t.string "fullname"
    t.string "stadium_location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "conference_id"
  end

  create_table "user_teams", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_user_teams_on_team_id"
    t.index ["user_id"], name: "index_user_teams_on_user_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "user_teams", "teams"
  add_foreign_key "user_teams", "users"
end
