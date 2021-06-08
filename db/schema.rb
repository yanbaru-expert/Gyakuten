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

ActiveRecord::Schema.define(version: 2021_06_08_022446) do

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
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "challenges", force: :cascade do |t|
    t.integer "position"
    t.string "title", null: false
    t.string "theme", null: false
    t.text "question", null: false
    t.text "hint"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "design_task_categories", force: :cascade do |t|
    t.integer "position"
    t.string "name", null: false
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "design_task_lists", force: :cascade do |t|
    t.integer "position"
    t.text "body", null: false
    t.bigint "design_task_category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["design_task_category_id"], name: "index_design_task_lists_on_design_task_category_id"
  end

  create_table "faqs", force: :cascade do |t|
    t.string "question"
    t.string "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
    t.integer "genre", default: 0
  end

  create_table "genres", force: :cascade do |t|
    t.string "name", null: false
    t.string "color"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code_name"
    t.index ["code_name"], name: "index_genres_on_code_name", unique: true
  end

  create_table "lines", force: :cascade do |t|
    t.string "genre"
    t.string "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "memo_examples", force: :cascade do |t|
    t.integer "position"
    t.text "content", null: false
    t.string "remark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "memos", force: :cascade do |t|
    t.bigint "user_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_memos_on_user_id"
  end

  create_table "money", force: :cascade do |t|
    t.string "genre"
    t.string "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.text "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "genre_id"
    t.integer "position"
    t.integer "text_id"
  end

  create_table "progresses", force: :cascade do |t|
    t.bigint "user_id"
    t.string "materiable_type"
    t.bigint "materiable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["materiable_type", "materiable_id"], name: "index_progresses_on_materiable_type_and_materiable_id"
    t.index ["user_id", "materiable_id", "materiable_type"], name: "progresses_index", unique: true
    t.index ["user_id"], name: "index_progresses_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.text "solution"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "genre_id"
    t.integer "position"
  end

  create_table "text_images", force: :cascade do |t|
    t.bigint "user_id"
    t.string "image"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_text_images_on_user_id"
  end

  create_table "texts", force: :cascade do |t|
    t.integer "genre_id"
    t.string "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.integer "position"
    t.string "image"
  end

  create_table "user_roles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "genre_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_user_roles_on_genre_id"
    t.index ["user_id", "genre_id"], name: "index_user_roles_on_user_id_and_genre_id", unique: true
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.boolean "flag", default: false
    t.string "slack_id", null: false
    t.datetime "approval_at"
    t.integer "slack_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["slack_id"], name: "index_users_on_slack_id", unique: true
  end

  create_table "users_webs", force: :cascade do |t|
    t.text "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "genre"
  end

  create_table "words", force: :cascade do |t|
    t.string "about"
    t.string "words"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "design_task_lists", "design_task_categories"
  add_foreign_key "memos", "users"
  add_foreign_key "movies", "genres"
  add_foreign_key "progresses", "users"
  add_foreign_key "questions", "genres"
  add_foreign_key "text_images", "users"
  add_foreign_key "texts", "genres"
  add_foreign_key "user_roles", "genres"
  add_foreign_key "user_roles", "users"
end
