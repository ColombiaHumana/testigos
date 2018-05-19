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

ActiveRecord::Schema.define(version: 20180519224020) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

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
    t.integer "mens"
    t.integer "womens"
    t.string "address"
    t.integer "cod_post"
    t.index ["cod_post"], name: "index_posts_on_cod_post"
    t.index ["name"], name: "index_posts_on_name"
    t.index ["tables"], name: "index_posts_on_tables"
    t.index ["zone_id"], name: "index_posts_on_zone_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
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
    t.bigint "zone_id"
    t.bigint "post_id"
    t.integer "table"
    t.string "departamento"
    t.string "municipio"
    t.string "puesto"
    t.string "mesa"
    t.string "zona"
    t.boolean "outside_witness"
    t.string "divipol"
    t.boolean "checked"
    t.boolean "verified"
    t.index ["department_id"], name: "index_witnesses_on_department_id"
    t.index ["divipol"], name: "index_witnesses_on_divipol"
    t.index ["municipality_id"], name: "index_witnesses_on_municipality_id"
    t.index ["post_id"], name: "index_witnesses_on_post_id"
    t.index ["zone_id"], name: "index_witnesses_on_zone_id"
  end

  create_table "zones", force: :cascade do |t|
    t.string "name"
    t.bigint "municipality_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cod_zone"
    t.index ["cod_zone"], name: "index_zones_on_cod_zone"
    t.index ["municipality_id"], name: "index_zones_on_municipality_id"
  end

  add_foreign_key "municipalities", "departments"
  add_foreign_key "posts", "zones"
  add_foreign_key "witnesses", "departments"
  add_foreign_key "witnesses", "municipalities"
  add_foreign_key "witnesses", "posts"
  add_foreign_key "witnesses", "zones"
  add_foreign_key "zones", "municipalities"
end
