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

ActiveRecord::Schema.define(version: 2020_04_22_062937) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "meetings", force: :cascade do |t|
    t.bigint "user_slot_id", null: false
    t.integer "booked_by_id"
    t.string "status", default: "Booked"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_slot_id"], name: "index_meetings_on_user_slot_id"
  end

  create_table "otps", force: :cascade do |t|
    t.string "phone", null: false
    t.string "password", null: false
    t.datetime "expiry"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "slot_types", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "slots", force: :cascade do |t|
    t.string "from", null: false
    t.string "to", null: false
    t.bigint "slot_type_id", null: false
    t.index ["slot_type_id"], name: "index_slots_on_slot_type_id"
  end

  create_table "user_slots", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "slot_id", null: false
    t.date "slot_date", null: false
    t.index ["slot_id"], name: "index_user_slots_on_slot_id"
    t.index ["user_id", "slot_id", "slot_date"], name: "index_user_slots_on_user_id_and_slot_id_and_slot_date", unique: true
    t.index ["user_id"], name: "index_user_slots_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "full_name", null: false
    t.string "phone"
    t.string "uuid", null: false
    t.boolean "guest", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["phone"], name: "index_users_on_phone", unique: true
    t.index ["uuid"], name: "index_users_on_uuid", unique: true
  end

  add_foreign_key "meetings", "user_slots"
  add_foreign_key "slots", "slot_types"
  add_foreign_key "user_slots", "slots"
  add_foreign_key "user_slots", "users"
end
