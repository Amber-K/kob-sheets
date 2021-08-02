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

ActiveRecord::Schema.define(version: 2021_07_27_044744) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: :cascade do |t|
    t.string "name", default: ""
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "allegiance"
    t.string "class_option"
    t.integer "level"
    t.integer "current_health"
    t.string "age"
    t.string "sex"
    t.string "height"
    t.string "weight"
    t.string "body_type"
    t.string "skin"
    t.string "race_ethnicity"
    t.string "eyes"
    t.string "hair"
    t.string "distinguishing_features"
    t.string "outfit"
    t.string "carries"
    t.string "species"
    t.string "family_type"
    t.text "family_description"
    t.string "occupation_type"
    t.text "occupation_description"
    t.string "backstory_type"
    t.text "backstory_description"
    t.text "likes"
    t.text "dislikes"
    t.string "hobby_type"
    t.text "hobby_description"
    t.string "habit_type"
    t.text "habit_description"
    t.string "fear_type"
    t.text "fear_description"
    t.string "quirk_type"
    t.text "quirk_description"
    t.integer "base_athleticism"
    t.integer "base_coordination"
    t.integer "base_drive"
    t.integer "base_knowledge"
    t.integer "base_openness"
    t.integer "base_sociability"
    t.integer "base_stability"
    t.integer "base_destroy"
    t.integer "base_grip"
    t.integer "base_leap"
    t.integer "base_run"
    t.integer "base_throw"
    t.integer "base_balance"
    t.integer "base_evade"
    t.integer "base_maneuver"
    t.integer "base_sneak"
    t.integer "base_create"
    t.integer "base_endure"
    t.integer "base_regulate"
    t.integer "base_debate"
    t.integer "base_decipher"
    t.integer "base_diagnose"
    t.integer "base_infer"
    t.integer "base_recall"
    t.integer "base_improvise"
    t.integer "base_notice"
    t.integer "base_impress"
    t.integer "base_lead"
    t.integer "base_lie"
    t.integer "base_please"
    t.integer "base_empathize"
    t.integer "base_soothe"
    t.text "base_specialties"
    t.index ["user_id"], name: "index_characters_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "password_digest", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "characters", "users"
end
