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

ActiveRecord::Schema[7.0].define(version: 2022_06_13_182959) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.uuid "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_analytics_views_per_days", force: :cascade do |t|
    t.string "site", null: false
    t.string "page", null: false
    t.date "date", null: false
    t.bigint "total", default: 1, null: false
    t.string "referrer_host"
    t.string "referrer_path"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["date"], name: "index_active_analytics_views_per_days_on_date"
    t.index ["referrer_host", "referrer_path", "date"], name: "index_active_analytics_views_per_days_on_referrer_and_date"
    t.index ["site", "page", "date"], name: "index_active_analytics_views_per_days_on_site_and_date"
  end

  create_table "active_storage_attachments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.uuid "record_id", null: false
    t.uuid "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "answered_questions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "answer_id", null: false
    t.uuid "question_id", null: false
    t.uuid "result_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_answered_questions_on_answer_id"
    t.index ["question_id"], name: "index_answered_questions_on_question_id"
    t.index ["result_id"], name: "index_answered_questions_on_result_id"
  end

  create_table "answers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "content"
    t.boolean "correct"
    t.uuid "question_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "blazer_audits", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "query_id"
    t.text "statement"
    t.string "data_source"
    t.datetime "created_at"
    t.index ["query_id"], name: "index_blazer_audits_on_query_id"
    t.index ["user_id"], name: "index_blazer_audits_on_user_id"
  end

  create_table "blazer_checks", force: :cascade do |t|
    t.bigint "creator_id"
    t.bigint "query_id"
    t.string "state"
    t.string "schedule"
    t.text "emails"
    t.text "slack_channels"
    t.string "check_type"
    t.text "message"
    t.datetime "last_run_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_blazer_checks_on_creator_id"
    t.index ["query_id"], name: "index_blazer_checks_on_query_id"
  end

  create_table "blazer_dashboard_queries", force: :cascade do |t|
    t.bigint "dashboard_id"
    t.bigint "query_id"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dashboard_id"], name: "index_blazer_dashboard_queries_on_dashboard_id"
    t.index ["query_id"], name: "index_blazer_dashboard_queries_on_query_id"
  end

  create_table "blazer_dashboards", force: :cascade do |t|
    t.bigint "creator_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_blazer_dashboards_on_creator_id"
  end

  create_table "blazer_queries", force: :cascade do |t|
    t.bigint "creator_id"
    t.string "name"
    t.text "description"
    t.text "statement"
    t.string "data_source"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_blazer_queries_on_creator_id"
  end

  create_table "city_ereas", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.uuid "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_city_ereas_on_user_id"
  end

  create_table "courses", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "level_name"
    t.string "material_name"
    t.string "teach_name"
    t.string "slug"
    t.string "contentImg"
    t.uuid "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_at"], name: "index_courses_on_created_at"
    t.index ["user_id"], name: "index_courses_on_user_id"
  end

  create_table "courses_exercices", id: false, force: :cascade do |t|
    t.uuid "course_id", null: false
    t.uuid "exercice_id", null: false
  end

  create_table "exercices", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.boolean "published"
    t.string "slug"
    t.uuid "user_id", null: false
    t.uuid "course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_exercices_on_course_id"
    t.index ["created_at"], name: "index_exercices_on_created_at"
    t.index ["user_id"], name: "index_exercices_on_user_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "levels", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.uuid "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_levels_on_user_id"
  end

  create_table "materials", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.uuid "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_materials_on_user_id"
  end

  create_table "posts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.uuid "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "questions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "content"
    t.text "answer"
    t.uuid "exercice_id", null: false
    t.uuid "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercice_id"], name: "index_questions_on_exercice_id"
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "results", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id", null: false
    t.uuid "exercice_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_at"], name: "index_results_on_created_at"
    t.index ["exercice_id"], name: "index_results_on_exercice_id"
    t.index ["user_id"], name: "index_results_on_user_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
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
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "full_name"
    t.string "matricule"
    t.string "gender", default: "", null: false
    t.string "slug"
    t.string "avatar_profil"
    t.string "contact", default: "", null: false
    t.string "payment_status"
    t.string "contact_money"
    t.string "opt_money"
    t.string "city_name", default: "", null: false
    t.string "level_name"
    t.string "material_name"
    t.string "school_name", default: "", null: false
    t.string "status", default: "Student", null: false
    t.string "terms"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "referral_in"
    t.string "referral_out"
    t.index ["created_at"], name: "index_users_on_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "welcomes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "math"
    t.string "pc"
    t.string "svt"
    t.string "hg"
    t.string "fr"
    t.string "ang"
    t.string "philo"
    t.string "all_esp"
    t.text "student_message"
    t.uuid "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_welcomes_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "answered_questions", "answers"
  add_foreign_key "answered_questions", "questions"
  add_foreign_key "answered_questions", "results"
  add_foreign_key "answers", "questions"
  add_foreign_key "city_ereas", "users"
  add_foreign_key "courses", "users"
  add_foreign_key "exercices", "courses"
  add_foreign_key "exercices", "users"
  add_foreign_key "levels", "users"
  add_foreign_key "materials", "users"
  add_foreign_key "posts", "users"
  add_foreign_key "questions", "exercices"
  add_foreign_key "questions", "users"
  add_foreign_key "results", "exercices"
  add_foreign_key "results", "users"
  add_foreign_key "welcomes", "users"
end
