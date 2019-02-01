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

ActiveRecord::Schema.define(version: 2019_02_01_124915) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "cagematches", force: :cascade do |t|
    t.string "title", null: false
    t.string "slug", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fights", force: :cascade do |t|
    t.string "tagline"
    t.string "location"
    t.text "notes"
    t.datetime "start_time"
    t.boolean "is_exhibition"
    t.bigint "winner_id"
    t.bigint "cagematch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "fightid"
    t.bigint "season_id"
    t.index ["cagematch_id"], name: "index_fights_on_cagematch_id"
    t.index ["season_id"], name: "index_fights_on_season_id"
    t.index ["winner_id"], name: "index_fights_on_winner_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title", null: false
    t.string "author"
    t.string "category", null: false
    t.text "text"
    t.datetime "published_at"
    t.bigint "cagematch_id"
    t.bigint "admin_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_user_id"], name: "index_posts_on_admin_user_id"
    t.index ["cagematch_id"], name: "index_posts_on_cagematch_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "cagematch_id"
    t.index ["cagematch_id"], name: "index_seasons_on_cagematch_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name", null: false
    t.string "tagline"
    t.bigint "cagematch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "teamid"
    t.index ["cagematch_id"], name: "index_teams_on_cagematch_id"
  end

  add_foreign_key "fights", "cagematches"
  add_foreign_key "fights", "seasons"
  add_foreign_key "fights", "teams", column: "winner_id"
  add_foreign_key "posts", "admin_users"
  add_foreign_key "posts", "cagematches"
  add_foreign_key "seasons", "cagematches"
  add_foreign_key "teams", "cagematches"
end
