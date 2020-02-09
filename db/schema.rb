# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_09_162318) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "counselors", force: :cascade do |t|
    t.string "pesel", limit: 13, null: false
    t.string "name", null: false
    t.string "surname", null: false
    t.string "address", null: false
    t.string "phone_number", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "counselors_groups", id: false, force: :cascade do |t|
    t.bigint "group_id", null: false
    t.bigint "counselor_id", null: false
    t.index ["counselor_id"], name: "index_counselors_groups_on_counselor_id"
    t.index ["group_id"], name: "index_counselors_groups_on_group_id"
  end

  create_table "groups", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "vacation_id"
    t.index ["vacation_id"], name: "index_groups_on_vacation_id"
  end

  create_table "groups_lodgings", id: false, force: :cascade do |t|
    t.bigint "group_id", null: false
    t.bigint "lodging_id", null: false
    t.index ["group_id"], name: "index_groups_lodgings_on_group_id"
    t.index ["lodging_id"], name: "index_groups_lodgings_on_lodging_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.date "date", null: false
    t.decimal "amount", null: false
    t.string "service", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "service_provider_id"
    t.bigint "vacation_id"
    t.string "organizer_nip"
    t.string "service_provider_nip"
    t.index ["service_provider_id"], name: "index_invoices_on_service_provider_id"
    t.index ["vacation_id"], name: "index_invoices_on_vacation_id"
  end

  create_table "lodgings", force: :cascade do |t|
    t.string "owner"
    t.string "company"
    t.integer "capacity"
    t.string "address"
    t.string "name"
    t.string "phone_number"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "organizers", force: :cascade do |t|
    t.string "nip", null: false
    t.string "email"
    t.string "name", null: false
    t.string "address", null: false
    t.string "phone_number", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "participants", force: :cascade do |t|
    t.string "pesel", limit: 11, null: false
    t.string "name", null: false
    t.string "surname", null: false
    t.string "school"
    t.string "phone_number", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "participations", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "group_id"
    t.bigint "participant_id"
    t.index ["group_id"], name: "index_participations_on_group_id"
    t.index ["participant_id"], name: "index_participations_on_participant_id"
  end

  create_table "payments", force: :cascade do |t|
    t.decimal "amount", null: false
    t.date "date", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "participation_id"
    t.index ["participation_id"], name: "index_payments_on_participation_id"
  end

  create_table "service_providers", force: :cascade do |t|
    t.string "nip"
    t.string "address"
    t.string "name"
    t.string "phone_number"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vacations", force: :cascade do |t|
    t.string "name", null: false
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "organizer_id"
    t.index ["organizer_id"], name: "index_vacations_on_organizer_id"
  end

  add_foreign_key "groups", "vacations"
  add_foreign_key "invoices", "service_providers"
  add_foreign_key "invoices", "vacations"
  add_foreign_key "participations", "groups"
  add_foreign_key "participations", "participants"
  add_foreign_key "payments", "participations"
  add_foreign_key "vacations", "organizers"
end
