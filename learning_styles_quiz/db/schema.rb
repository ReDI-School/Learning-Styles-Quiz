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

ActiveRecord::Schema.define(version: 2019_12_03_153344) do

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
