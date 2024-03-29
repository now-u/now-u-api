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

ActiveRecord::Schema.define(version: 2023_03_28_194251) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "groups", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.index ["email"], name: "index_admins_on_email", unique: true
  end

  create_table "app_versions", force: :cascade do |t|
    t.string "version_number"
    t.boolean "compatible_with_current_api"
    t.text "release_notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string "title", null: false
    t.text "body"
    t.string "header_image"
    t.string "full_article_link", null: false
    t.string "video_link"
    t.integer "campaign_action_id"
    t.integer "campaign_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "video_of_the_day", default: false
    t.string "subtitle", null: false
    t.string "link_text"
    t.string "source"
    t.boolean "enabled", default: false, null: false
    t.datetime "release_date"
  end

  create_table "blog_articles", force: :cascade do |t|
    t.string "title"
    t.string "subtitle"
    t.integer "campaign_action_id"
    t.integer "user_id"
    t.integer "campaign_id"
    t.integer "reading_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "enabled", default: false
    t.string "header_image"
  end

  create_table "blog_comments", force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.integer "blog_article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "blog_tags", force: :cascade do |t|
    t.integer "blog_article_id"
    t.integer "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "campaign_actions", force: :cascade do |t|
    t.string "title", null: false
    t.string "link", null: false
    t.string "type", null: false
    t.integer "campaign_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "what_description", null: false
    t.string "why_description", null: false
    t.float "time", null: false
    t.boolean "enabled", default: false, null: false
    t.datetime "release_date"
    t.datetime "end_date"
    t.boolean "of_the_month", default: false, null: false
    t.boolean "recommended", default: false, null: false
  end

  create_table "campaign_goals", force: :cascade do |t|
    t.integer "campaign_id"
    t.integer "goal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "campaign_learning_resources", force: :cascade do |t|
    t.bigint "campaign_id"
    t.bigint "learning_resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_campaign_learning_resources_on_campaign_id"
    t.index ["learning_resource_id"], name: "index_campaign_learning_resources_on_learning_resource_id"
  end

  create_table "campaigns", force: :cascade do |t|
    t.string "title", null: false
    t.text "description_app", null: false
    t.string "header_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "video_link"
    t.text "description_web"
    t.boolean "enabled", default: false, null: false
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "short_name", null: false
    t.string "infographic_url"
    t.boolean "of_the_month", null: false
    t.boolean "recommended", null: false
    t.integer "status", default: 0, null: false
  end

  create_table "cause_actions", force: :cascade do |t|
    t.bigint "cause_id", null: false
    t.bigint "campaign_action_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_action_id"], name: "index_cause_actions_on_campaign_action_id"
    t.index ["cause_id"], name: "index_cause_actions_on_cause_id"
  end

  create_table "cause_campaigns", force: :cascade do |t|
    t.bigint "cause_id", null: false
    t.bigint "campaign_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_cause_campaigns_on_campaign_id"
    t.index ["cause_id"], name: "index_cause_campaigns_on_cause_id"
  end

  create_table "cause_learning_resources", force: :cascade do |t|
    t.bigint "cause_id", null: false
    t.bigint "learning_resource_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cause_id"], name: "index_cause_learning_resources_on_cause_id"
    t.index ["learning_resource_id"], name: "index_cause_learning_resources_on_learning_resource_id"
  end

  create_table "causes", force: :cascade do |t|
    t.string "image"
    t.string "icon", null: false
    t.string "name", null: false
    t.string "description", null: false
    t.integer "joiners"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "faqs", force: :cascade do |t|
    t.string "question", null: false
    t.string "answer", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "goals", force: :cascade do |t|
    t.string "title"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "image_sections", force: :cascade do |t|
    t.string "img_url"
    t.integer "blog_article_id"
    t.integer "appearance_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "section_type", default: "image_section"
  end

  create_table "learning_resources", force: :cascade do |t|
    t.string "title", null: false
    t.float "time", null: false
    t.string "link", null: false
    t.string "type", null: false
    t.integer "learning_topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "source", null: false
    t.datetime "release_date"
    t.datetime "end_date"
  end

  create_table "learning_topics", force: :cascade do |t|
    t.string "title"
    t.string "image_link"
    t.string "our_answer"
    t.integer "campaign_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "priority", default: 0
  end

  create_table "notifications", force: :cascade do |t|
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "image"
    t.text "body"
    t.text "subtitle"
  end

  create_table "offers", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "link"
    t.integer "campaign_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "campaign_action_id"
  end

  create_table "organisations", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "logo_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "website"
    t.string "IG_link"
    t.string "FB_link"
    t.string "twitter_link"
    t.string "extra_text_1"
    t.string "extra_text_2"
    t.string "extra_text_3"
    t.string "extra_link_1"
    t.string "extra_link_2"
    t.string "extra_link_3"
    t.string "organisation_type"
    t.string "code"
    t.string "geographic_reach"
  end

  create_table "partnerships", force: :cascade do |t|
    t.integer "campaign_id"
    t.integer "organisation_id"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "press_coverage_articles", force: :cascade do |t|
    t.string "image_url"
    t.string "link", null: false
    t.string "media_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title", null: false
  end

  create_table "quiz_answers", force: :cascade do |t|
    t.string "answer_image_url"
    t.string "answer_text"
    t.boolean "is_correct", default: false
    t.integer "quiz_question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quiz_questions", force: :cascade do |t|
    t.string "question"
    t.integer "quiz_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quizzes", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "tag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "text_sections", force: :cascade do |t|
    t.text "content"
    t.integer "blog_article_id"
    t.integer "appearance_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "section_type", default: "text_section"
    t.string "title"
  end

  create_table "user_actions", force: :cascade do |t|
    t.integer "user_id"
    t.integer "campaign_action_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "comment"
  end

  create_table "user_campaigns", force: :cascade do |t|
    t.integer "user_id"
    t.integer "campaign_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "progress", default: 0
  end

  create_table "user_causes", force: :cascade do |t|
    t.bigint "cause_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cause_id"], name: "index_user_causes_on_cause_id"
    t.index ["user_id"], name: "index_user_causes_on_user_id"
  end

  create_table "user_learning_resources", force: :cascade do |t|
    t.integer "user_id"
    t.integer "learning_resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_notifications", force: :cascade do |t|
    t.integer "user_id"
    t.integer "notification_id"
    t.boolean "dismissed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "full_name"
    t.string "location"
    t.string "date_of_birth"
    t.float "monthly_donation_limit"
    t.boolean "home_owner"
    t.integer "points", default: 0
    t.integer "organisation_id"
    t.string "profile_picture_url"
    t.text "description"
    t.boolean "newsletter", default: false
    t.integer "user_role_id"
    t.string "auth_user_id", null: false
    t.index ["auth_user_id"], name: "index_users_on_auth_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "campaign_learning_resources", "campaigns"
  add_foreign_key "campaign_learning_resources", "learning_resources"
  add_foreign_key "cause_actions", "campaign_actions"
  add_foreign_key "cause_actions", "causes"
  add_foreign_key "cause_campaigns", "campaigns"
  add_foreign_key "cause_campaigns", "causes"
  add_foreign_key "cause_learning_resources", "causes"
  add_foreign_key "cause_learning_resources", "learning_resources"
  add_foreign_key "quiz_answers", "quiz_questions"
  add_foreign_key "quiz_questions", "quizzes"
  add_foreign_key "user_causes", "causes"
  add_foreign_key "user_causes", "users"
end
