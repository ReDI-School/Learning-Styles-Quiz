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

ActiveRecord::Schema.define(version: 2019_12_03_170747) do


  create_table "learning_styles", force: :cascade do |t|
    t.string "prompt"
    t.string "type1"
    t.string "type2"
    t.string "type3"
    t.string "type4"
  end

  create_table "questions", force: :cascade do |t|
    t.string "question"
    t.string "a"
    t.string "b"
    t.string "c"
    t.string "d"
  end

  create_table "quizzes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "question_id"
    t.string "answer"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
  end

end
