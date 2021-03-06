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

ActiveRecord::Schema.define(version: 2019_11_19_011505) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "questions", force: :cascade do |t|
    t.integer "question_ID"
    t.text "category"
    t.text "question_type"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_ID"], name: "index_questions_on_question_ID", unique: true
  end

  create_table "sections", force: :cascade do |t|
    t.integer "class_num"
    t.integer "enrolled"
    t.integer "completed", default: 0
    t.text "subject"
    t.text "catalog"
    t.text "title"
    t.integer "section"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "professor_email"
    t.index ["class_num"], name: "index_sections_on_class_num", unique: true
  end

  create_table "surveys", force: :cascade do |t|
    t.integer "student_ID"
    t.text "student_email"
    t.integer "class_num"
    t.integer "survey_ID"
    t.boolean "status"
    t.text "Q1"
    t.text "Q2"
    t.text "Q3"
    t.text "Q4"
    t.text "Q5"
    t.text "Q6"
    t.text "Q7"
    t.text "Q8"
    t.text "Q9"
    t.text "Q10"
    t.text "Q11"
    t.text "Q12"
    t.text "Q13"
    t.text "Q14"
    t.text "Q15"
    t.text "Q16"
    t.text "Q17"
    t.text "Q18"
    t.text "Q19"
    t.text "Q20"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "key"
    t.index ["student_ID"], name: "index_surveys_on_student_ID", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.text "name"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
