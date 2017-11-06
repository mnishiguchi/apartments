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

ActiveRecord::Schema.define(version: 20171028184443) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "amenities", force: :cascade do |t|
    t.string "identifier", null: false
    t.string "title", null: false
    t.string "tags", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "apartment_amenities", force: :cascade do |t|
    t.bigint "apartment_id"
    t.bigint "amenity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["amenity_id"], name: "index_apartment_amenities_on_amenity_id"
    t.index ["apartment_id"], name: "index_apartment_amenities_on_apartment_id"
  end

  create_table "apartment_locations", force: :cascade do |t|
    t.text "description"
    t.bigint "apartment_id"
    t.bigint "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["apartment_id"], name: "index_apartment_locations_on_apartment_id"
    t.index ["location_id"], name: "index_apartment_locations_on_location_id"
  end

  create_table "apartments", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.text "description"
    t.string "url"
    t.string "phone"
    t.jsonb "office_hours", default: {}
    t.bigint "management_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["management_id"], name: "index_apartments_on_management_id"
  end

  create_table "floorplan_amenities", force: :cascade do |t|
    t.bigint "floorplan_id"
    t.bigint "amenity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["amenity_id"], name: "index_floorplan_amenities_on_amenity_id"
    t.index ["floorplan_id"], name: "index_floorplan_amenities_on_floorplan_id"
  end

  create_table "floorplans", force: :cascade do |t|
    t.string "name"
    t.string "identifier"
    t.string "image_url"
    t.string "description"
    t.string "availabitity_url"
    t.decimal "bathroom_count"
    t.decimal "bedroom_count"
    t.integer "rent_min"
    t.integer "rent_max"
    t.integer "sqft_min"
    t.integer "sqft_max"
    t.integer "unit_count_total"
    t.integer "unit_count_available"
    t.bigint "apartment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["apartment_id"], name: "index_floorplans_on_apartment_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "label"
    t.string "layer"
    t.decimal "latitude"
    t.decimal "longitude"
    t.string "address_1"
    t.string "address_2"
    t.string "county"
    t.string "city"
    t.string "state"
    t.string "neighbourhood"
    t.string "postal_code"
    t.string "country"
    t.jsonb "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "management_locations", force: :cascade do |t|
    t.text "description"
    t.bigint "management_id"
    t.bigint "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_management_locations_on_location_id"
    t.index ["management_id"], name: "index_management_locations_on_management_id"
  end

  create_table "managements", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "identifier"
    t.string "url"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "apartment_amenities", "amenities"
  add_foreign_key "apartment_amenities", "apartments"
  add_foreign_key "apartment_locations", "apartments"
  add_foreign_key "apartment_locations", "locations"
  add_foreign_key "apartments", "managements"
  add_foreign_key "floorplan_amenities", "amenities"
  add_foreign_key "floorplan_amenities", "floorplans"
  add_foreign_key "floorplans", "apartments"
  add_foreign_key "management_locations", "locations"
  add_foreign_key "management_locations", "managements"
end
