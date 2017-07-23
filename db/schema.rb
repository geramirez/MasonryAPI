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

ActiveRecord::Schema.define(version: 20161108012802) do

  create_table "components", force: :cascade do |t|
    t.string "name"
    t.string "key"
    t.boolean "documentation_complete"
    t.string "schema_version"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "components_verifications", id: false, force: :cascade do |t|
    t.integer "component_id"
    t.integer "verification_id"
    t.index ["component_id"], name: "index_components_verifications_on_component_id"
    t.index ["verification_id"], name: "index_components_verifications_on_verification_id"
  end

  create_table "references", force: :cascade do |t|
    t.string "name"
    t.string "path"
    t.string "kind"
    t.integer "component_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["component_id"], name: "index_references_on_component_id"
  end

  create_table "satisfies", force: :cascade do |t|
    t.string "standard_key"
    t.string "control_key"
    t.integer "component_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["component_id"], name: "index_satisfies_on_component_id"
  end

  create_table "verifications", force: :cascade do |t|
    t.string "name"
    t.string "key"
    t.string "path"
    t.string "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
