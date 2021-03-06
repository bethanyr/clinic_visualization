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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141126174307) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "allergies", force: true do |t|
    t.string   "name"
    t.date     "start_date"
    t.string   "symptoms"
    t.string   "treatment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "patient_id"
  end

  create_table "doctors", force: true do |t|
    t.string   "name"
    t.string   "specialty"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "organization"
    t.string   "phone"
    t.string   "street_address"
    t.string   "state"
    t.string   "postal_code"
    t.string   "country"
    t.string   "city"
  end

  create_table "immunizations", force: true do |t|
    t.string   "name"
    t.date     "given_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "patient_id"
  end

  create_table "interactions", force: true do |t|
    t.string   "interaction"
    t.integer  "medicine_id"
    t.text     "symptoms"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "link"
  end

  create_table "medical_conditions", force: true do |t|
    t.string   "name"
    t.integer  "doctor_id"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "active"
    t.integer  "visit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "patient_id"
    t.text     "notes"
  end

  create_table "medical_records", force: true do |t|
    t.string   "type"
    t.string   "name"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "patient_id"
    t.integer  "visit_id"
    t.string   "result"
    t.decimal  "value"
    t.string   "description"
    t.integer  "medical_condition_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "units"
    t.string   "loinc"
    t.string   "long_name"
    t.string   "ndc"
    t.string   "medicine_type"
    t.decimal  "quantity"
    t.decimal  "refills"
    t.text     "notes"
    t.integer  "medicine_id"
    t.integer  "doctor_id"
  end

  create_table "medicines", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notes", force: true do |t|
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "noteable_id"
    t.string   "noteable_type"
    t.date     "note_date"
  end

  create_table "patients", force: true do |t|
    t.string   "name"
    t.date     "birth_date"
    t.string   "gender"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prescriptions", force: true do |t|
    t.integer  "medicine_id"
    t.integer  "doctor_id"
    t.integer  "patient_id"
    t.integer  "visit_id"
    t.integer  "medical_condition_id"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "remarks"
    t.string   "dosage"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
    t.integer  "patient_id"
    t.integer  "doctor_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "visits", force: true do |t|
    t.date     "visit_date"
    t.string   "chief_complaint"
    t.string   "diagnosis"
    t.string   "icd_9"
    t.string   "height"
    t.integer  "weight"
    t.string   "pulse"
    t.string   "respiration"
    t.string   "blood_pressure"
    t.text     "notes"
    t.integer  "patient_id"
    t.integer  "doctor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bp1"
    t.integer  "bp2"
    t.string   "smoking"
    t.string   "exercise"
    t.string   "alcohol_intake"
  end

end
