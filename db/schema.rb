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

ActiveRecord::Schema.define(version: 20180326035053) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.integer "cod_department"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cod_department"], name: "index_departments_on_cod_department"
  end

  create_table "municipalities", force: :cascade do |t|
    t.string "name"
    t.integer "cod_department"
    t.integer "cod_municipality"
    t.bigint "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cod_department"], name: "index_municipalities_on_cod_department"
    t.index ["cod_municipality"], name: "index_municipalities_on_cod_municipality"
    t.index ["department_id"], name: "index_municipalities_on_department_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "name"
    t.bigint "zone_id"
    t.integer "tables"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tables"], name: "index_posts_on_tables"
    t.index ["zone_id"], name: "index_posts_on_zone_id"
  end

  create_table "witnesses", force: :cascade do |t|
    t.integer "doc_number"
    t.string "first_name"
    t.string "second_name"
    t.string "surname"
    t.string "second_surname"
    t.boolean "has_smartphone"
    t.string "phone"
    t.string "email"
    t.boolean "foreing"
    t.bigint "department_id"
    t.bigint "municipality_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_witnesses_on_department_id"
    t.index ["municipality_id"], name: "index_witnesses_on_municipality_id"
  end

  create_table "zones", force: :cascade do |t|
    t.string "name"
    t.bigint "municipality_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["municipality_id"], name: "index_zones_on_municipality_id"
  end

  add_foreign_key "municipalities", "departments"
  add_foreign_key "posts", "zones"
  add_foreign_key "witnesses", "departments"
  add_foreign_key "witnesses", "municipalities"
  add_foreign_key "zones", "municipalities"
end
