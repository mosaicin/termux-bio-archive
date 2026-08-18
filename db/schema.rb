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

ActiveRecord::Schema[7.2].define(version: 2026_08_18_130604) do
  create_table "biographies", force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.text "summary"
    t.text "body"
    t.string "status", default: "draft", null: false
    t.boolean "fictional", default: true, null: false
    t.string "author_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "open_questions", force: :cascade do |t|
    t.integer "biography_id", null: false
    t.text "prompt"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["biography_id"], name: "index_open_questions_on_biography_id"
  end

  create_table "responses", force: :cascade do |t|
    t.integer "biography_id", null: false
    t.string "name"
    t.text "body"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["biography_id"], name: "index_responses_on_biography_id"
  end

  create_table "sources", force: :cascade do |t|
    t.integer "biography_id", null: false
    t.string "title"
    t.string "url"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["biography_id"], name: "index_sources_on_biography_id"
  end

  add_foreign_key "open_questions", "biographies"
  add_foreign_key "responses", "biographies"
  add_foreign_key "sources", "biographies"
end
