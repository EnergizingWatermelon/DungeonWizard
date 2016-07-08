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

ActiveRecord::Schema.define(version: 20160708023924) do

  create_table "abilities", force: :cascade do |t|
    t.string   "name"
    t.string   "type"
    t.text     "description"
    t.integer  "character_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "abilities", ["character_id"], name: "index_abilities_on_character_id"

  create_table "adventures", force: :cascade do |t|
    t.string   "title"
    t.text     "plot"
    t.integer  "party_size"
    t.float    "cr"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "characters", force: :cascade do |t|
    t.string  "name"
    t.integer "xp"
    t.float   "cr"
    t.integer "initiative"
    t.integer "speed"
    t.integer "hp"
    t.integer "ac"
    t.integer "ac_touch"
    t.integer "ac_flat"
    t.integer "fort_save"
    t.integer "ref_save"
    t.integer "will_save"
    t.integer "str"
    t.integer "dex"
    t.integer "con"
    t.integer "int"
    t.integer "wis"
    t.integer "cha"
    t.string  "monster_type"
    t.string  "alignment"
    t.string  "organization"
    t.string  "environment"
    t.string  "treasure"
    t.text    "description"
  end

  create_table "encounters", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "maps", force: :cascade do |t|
    t.string  "name"
    t.integer "seed"
    t.string  "climate"
    t.string  "terrain"
    t.integer "adventure_id"
  end

  add_index "maps", ["adventure_id"], name: "index_maps_on_adventure_id"

end
