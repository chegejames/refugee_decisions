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

ActiveRecord::Schema.define(:version => 20130603184220) do

  create_table "cases", :force => true do |t|
    t.integer  "judge_id"
    t.integer  "cause_id"
    t.string   "case_number"
    t.text     "summary_of_decision"
    t.date     "year_of_judgement"
    t.string   "court"
    t.text     "complainant"
    t.text     "defendant"
    t.text     "state"
    t.text     "accused"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "cases", ["cause_id"], :name => "index_cases_on_cause_id"
  add_index "cases", ["judge_id"], :name => "index_cases_on_judge_id"

  create_table "causes", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "category"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "judges", :force => true do |t|
    t.string   "name"
    t.date     "date_of_training"
    t.boolean  "trained"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

end
