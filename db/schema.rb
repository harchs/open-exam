# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121205160524) do

  create_table "answers", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "quiz_id"
    t.integer  "question_id"
    t.integer  "choice_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "answers", ["user_id"], :name => "index_answers_on_user_id"

  create_table "choices", :force => true do |t|
    t.text     "name"
    t.boolean  "is_correct",  :default => false
    t.integer  "question_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "choices", ["question_id"], :name => "index_choices_on_question_id"

  create_table "organizations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "subdomain"
    t.string   "invite_code"
  end

  create_table "questions", :force => true do |t|
    t.text     "name"
    t.integer  "quiz_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "position"
    t.boolean  "selected",   :default => false
    t.integer  "user_id"
  end

  add_index "questions", ["quiz_id"], :name => "index_questions_on_quiz_id"

  create_table "quizzes", :force => true do |t|
    t.string   "name"
    t.integer  "creator_id"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.text     "description"
    t.boolean  "is_published",    :default => false
    t.integer  "passing_grade"
    t.integer  "organization_id"
  end

  create_table "user_quizzes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "quiz_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "num_correct"
    t.integer  "total_questions"
    t.text     "status"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "organization_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "role"
  end

end
