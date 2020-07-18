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

ActiveRecord::Schema.define(version: 2020_07_18_163046) do

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
    t.boolean "enabled", default: false
    t.datetime "release_date"
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
    t.string "subtitle"
    t.string "link_text"
    t.string "source"
    t.boolean "enabled", default: false
    t.datetime "release_date"
  end

  create_table "blog_articles", force: :cascade do |t|
    t.string "title"
    t.string "subtitle"
    t.integer "action_id"
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

  create_table "campaign_goals", force: :cascade do |t|
    t.integer "campaign_id"
    t.integer "goal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "campaigns", force: :cascade do |t|
    t.string "title"
    t.text "description_app"
    t.string "header_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "video_link"
    t.text "description_web"
    t.boolean "enabled", default: false
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "short_name"
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

  create_table "image_sections", force: :cascade do |t|
    t.string "img_url"
    t.integer "blog_article_id"
    t.integer "appearance_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "section_type", default: "image_section"
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
    t.string "link"
    t.string "media_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
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
    t.integer "action_id"
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

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "token"
    t.boolean "verified", default: false
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
  end

end
