# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_08_211447) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text "statement"
    t.integer "user_id"
    t.integer "video_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "image"
    t.string "video"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer "user_id"
    t.integer "sub_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "email"
    t.text "description"
    t.string "image"
    t.string "banner"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.string "username"
  end

  create_table "video_likes", force: :cascade do |t|
    t.bigint "video_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "like"
    t.boolean "dislike"
    t.index ["user_id"], name: "index_video_likes_on_user_id"
    t.index ["video_id"], name: "index_video_likes_on_video_id"
  end

  create_table "videodis_likes", force: :cascade do |t|
    t.bigint "video_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_videodis_likes_on_user_id"
    t.index ["video_id"], name: "index_videodis_likes_on_video_id"
  end

  create_table "videos", force: :cascade do |t|
    t.string "url"
    t.string "title"
    t.integer "views"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "thumbnail"
    t.integer "user_id"
  end

  add_foreign_key "video_likes", "users"
  add_foreign_key "video_likes", "videos"
  add_foreign_key "videodis_likes", "users"
  add_foreign_key "videodis_likes", "videos"
end
