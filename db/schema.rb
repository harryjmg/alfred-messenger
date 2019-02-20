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

ActiveRecord::Schema.define(version: 20190220101601) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "flow_entries", force: :cascade do |t|
    t.string "what"
    t.string "feeling"
    t.string "flow"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "activity_name"
    t.string "activity_categorty"
    t.integer "challenge_level"
    t.integer "skill_level"
    t.integer "feeling_competent"
    t.integer "mentally_absorbed"
    t.integer "clear_objectives"
    t.integer "control_situation"
    t.integer "free_from_ego"
    t.integer "free_from_time"
    t.integer "clear_conditions"
    t.integer "great_experience"
    t.boolean "is_voluntary"
    t.integer "happiness_level"
    t.integer "social_quality"
  end

  create_table "users", force: :cascade do |t|
    t.string "psid"
    t.string "first_name"
    t.string "last_name"
    t.boolean "flow_testing"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "flow_test_cursor"
    t.string "flow_test_intervals"
    t.string "private_id"
  end

end
