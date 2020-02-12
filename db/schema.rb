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

ActiveRecord::Schema.define(version: 2020_02_12_212104) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "counselors", primary_key: "pesel", id: :string, limit: 11, force: :cascade do |t|
    t.string "name", limit: 20, null: false
    t.string "surname", limit: 40, null: false
    t.string "address", limit: 50, null: false
    t.string "phone_number", limit: 12, null: false
  end

  create_table "group_supervision", primary_key: ["counselor_pesel", "group_id"], force: :cascade do |t|
    t.string "counselor_pesel", limit: 11, null: false
    t.integer "group_id", null: false
  end

  create_table "groups", id: :serial, force: :cascade do |t|
    t.string "vacation_name", limit: 50, null: false
  end

  create_table "hostings", primary_key: ["group_id", "lodging_name"], force: :cascade do |t|
    t.integer "group_id", null: false
    t.string "lodging_name", limit: 50, null: false
  end

  create_table "invoices", primary_key: "invoice_number", id: :serial, force: :cascade do |t|
    t.date "date", null: false
    t.decimal "amount", precision: 12, scale: 2, null: false
    t.string "service_provider_nip", limit: 10, null: false
    t.string "organizer_nip", limit: 10, null: false
    t.string "vacation_name", limit: 50, null: false
    t.string "service", limit: 100, null: false
  end

  create_table "lodgings", primary_key: "name", id: :string, limit: 50, force: :cascade do |t|
    t.string "address", limit: 50, null: false
    t.integer "capacity", null: false
    t.string "owner", limit: 50, null: false
    t.string "phone_number", limit: 12, null: false
    t.string "email", limit: 40
    t.string "company", limit: 50, null: false
  end

  create_table "organizers", primary_key: "nip", id: :string, limit: 10, force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.string "address", limit: 50, null: false
    t.string "phone_number", limit: 12, null: false
    t.string "email", limit: 40
  end

  create_table "participants", primary_key: "pesel", id: :string, limit: 11, force: :cascade do |t|
    t.string "name", limit: 20, null: false
    t.string "surname", limit: 40, null: false
    t.string "school", limit: 100
    t.string "phone_number", limit: 12, null: false
  end

  create_table "participations", primary_key: ["participant_pesel", "group_id"], force: :cascade do |t|
    t.string "participant_pesel", limit: 11, null: false
    t.integer "group_id", null: false
  end

  create_table "payments", id: :serial, force: :cascade do |t|
    t.decimal "amount", precision: 12, scale: 2, null: false
    t.date "date", null: false
    t.string "participant_pesel", limit: 11, null: false
    t.integer "group_id", null: false
  end

  create_table "service_providers", primary_key: "nip", id: :string, limit: 10, force: :cascade do |t|
    t.string "address", limit: 50, null: false
    t.string "name", limit: 50, null: false
    t.string "phone_number", limit: 12, null: false
    t.string "email", limit: 40, null: false
  end

  create_table "vacations", primary_key: "name", id: :string, limit: 50, force: :cascade do |t|
    t.string "organizer_nip", limit: 10, null: false
    t.date "start_date", null: false
    t.date "end_date", null: false
  end

  add_foreign_key "group_supervision", "counselors", column: "counselor_pesel", primary_key: "pesel", name: "group_supervision_counselors_fk", on_delete: :cascade
  add_foreign_key "group_supervision", "groups", name: "group_supervision_group_fk", on_delete: :cascade
  add_foreign_key "groups", "vacations", column: "vacation_name", primary_key: "name", name: "groups_vacations_fk"
  add_foreign_key "hostings", "groups", name: "hostings_groups_fk", on_delete: :cascade
  add_foreign_key "hostings", "lodgings", column: "lodging_name", primary_key: "name", name: "hostings_lodgings_fk", on_delete: :cascade
  add_foreign_key "invoices", "organizers", column: "organizer_nip", primary_key: "nip", name: "invoices_organizers_fk"
  add_foreign_key "invoices", "service_providers", column: "service_provider_nip", primary_key: "nip", name: "invoices_service_providers_fk"
  add_foreign_key "invoices", "vacations", column: "vacation_name", primary_key: "name", name: "invoices_vacations_fk"
  add_foreign_key "participations", "groups", name: "participations_group_fk", on_delete: :cascade
  add_foreign_key "participations", "participants", column: "participant_pesel", primary_key: "pesel", name: "participations_participants_fk", on_delete: :cascade
  add_foreign_key "payments", "participations", column: "participant_pesel", primary_key: "participant_pesel", name: "payments_participations_fk"
  add_foreign_key "vacations", "organizers", column: "organizer_nip", primary_key: "nip", name: "vacations_organizers_fk"
end
