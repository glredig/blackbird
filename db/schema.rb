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

ActiveRecord::Schema.define(version: 2019_02_18_045315) do

  create_table "bios", force: :cascade do |t|
    t.string "name"
    t.string "instruments"
    t.text "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "bio_image"
    t.integer "position"
  end

  create_table "events", force: :cascade do |t|
    t.text "summary"
    t.integer "accessible"
    t.text "location"
    t.datetime "date"
    t.integer "pay"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "media_events", force: :cascade do |t|
    t.string "summary"
    t.datetime "event_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "media_images", force: :cascade do |t|
    t.string "summary"
    t.string "credit"
    t.string "media_gallery_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "media_event_id"
  end

  create_table "news_items", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.boolean "publish", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string "name"
    t.datetime "date"
    t.text "summary"
    t.string "event"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "last_name"
  end

  create_table "slides", force: :cascade do |t|
    t.string "summary"
    t.string "caption"
    t.string "slide_image"
    t.integer "label_placement"
    t.integer "position"
    t.boolean "publish", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "songs", force: :cascade do |t|
    t.string "title"
    t.string "artist"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sound_clip"
    t.integer "release_date"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
