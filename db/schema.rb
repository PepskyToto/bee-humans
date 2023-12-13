# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2023_12_13_104159) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chatrooms", force: :cascade do |t|
    t.bigint "helper_id"
    t.bigint "needer_id"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "request_id"
    t.index ["helper_id"], name: "index_chatrooms_on_helper_id"
    t.index ["needer_id"], name: "index_chatrooms_on_needer_id"
    t.index ["request_id"], name: "index_chatrooms_on_request_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "content"
    t.bigint "user_id", null: false
    t.bigint "chatroom_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chatroom_id"], name: "index_messages_on_chatroom_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "requests", force: :cascade do |t|
    t.text "description"
    t.string "title"
    t.bigint "skill_id", null: false
    t.bigint "user_id", null: false
    t.date "date"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["skill_id"], name: "index_requests_on_skill_id"
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.text "description"
    t.bigint "reviewer_id"
    t.bigint "reviewee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reviewee_id"], name: "index_reviews_on_reviewee_id"
    t.index ["reviewer_id"], name: "index_reviews_on_reviewer_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "category"
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
    t.string "address"
    t.integer "pollen", default: 1
    t.integer "average_rating"
    t.string "username"
    t.float "latitude"
    t.float "longitude"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_skills", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "skill_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["skill_id"], name: "index_users_skills_on_skill_id"
    t.index ["user_id"], name: "index_users_skills_on_user_id"
  end

  add_foreign_key "chatrooms", "requests"
  add_foreign_key "chatrooms", "users", column: "helper_id"
  add_foreign_key "chatrooms", "users", column: "needer_id"
  add_foreign_key "messages", "chatrooms"
  add_foreign_key "messages", "users"
  add_foreign_key "requests", "skills"
  add_foreign_key "requests", "users"
  add_foreign_key "reviews", "users", column: "reviewee_id"
  add_foreign_key "reviews", "users", column: "reviewer_id"
  add_foreign_key "users_skills", "skills"
  add_foreign_key "users_skills", "users"
end
