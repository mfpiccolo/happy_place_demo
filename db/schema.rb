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

ActiveRecord::Schema.define(version: 20141103054052) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "line_items", force: true do |t|
    t.string   "sku"
    t.integer  "price_cents"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "request_id"
  end

  create_table "orders", force: true do |t|
    t.string   "state"
    t.string   "customer_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchase_orders", force: true do |t|
    t.string   "state"
    t.string   "important_info"
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "purchase_orders", ["order_id"], name: "index_purchase_orders_on_order_id", using: :btree

  create_table "requests", force: true do |t|
    t.string   "type"
    t.string   "shipping_address"
    t.integer  "purchase_order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "requests", ["purchase_order_id"], name: "index_requests_on_purchase_order_id", using: :btree

end
