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

ActiveRecord::Schema.define(version: 2020_06_06_170738) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actions", force: :cascade do |t|
    t.string "title"
    t.string "link"
    t.string "type"
    t.integer "campaign_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "what_description"
    t.string "why_description"
    t.float "time"
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.string "header_image"
    t.string "full_article_link"
    t.string "video_link"
    t.integer "action_id"
    t.integer "campaign_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "video_of_the_day", default: false
  end

  create_table "campaign_goals", force: :cascade do |t|
    t.integer "campaign_id"
    t.integer "goal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "campaigns", force: :cascade do |t|
    t.string "title"
    t.text "description_app"
    t.integer "number_of_campaigners"
    t.string "header_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "video_link"
    t.text "description_web"
  end

  create_table "faqs", force: :cascade do |t|
    t.string "question"
    t.string "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "goals", force: :cascade do |t|
    t.string "title"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "learning_resources", force: :cascade do |t|
    t.string "title"
    t.float "time"
    t.string "link"
    t.string "type"
    t.integer "learning_topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "learning_topics", force: :cascade do |t|
    t.string "title"
    t.string "image_link"
    t.string "our_answer"
    t.integer "campaign_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offers", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "link"
    t.integer "campaign_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "action_id"
  end

  create_table "organisations", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "logo_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "website"
  end

  create_table "partnerships", force: :cascade do |t|
    t.integer "campaign_id"
    t.integer "organisation_id"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_actions", force: :cascade do |t|
    t.integer "user_id"
    t.integer "action_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_campaigns", force: :cascade do |t|
    t.integer "user_id"
    t.integer "campaign_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "progress", default: 0
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "token"
    t.boolean "verified", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
