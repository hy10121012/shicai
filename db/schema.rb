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

ActiveRecord::Schema.define(version: 20160316224129) do

  create_table "attribute_overrides", force: true do |t|
    t.string   "type"
    t.string   "scope"
    t.string   "attr_value"
    t.integer  "attr_entity_id"
    t.integer  "start_date"
    t.integer  "end_date"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "brands", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cities", force: true do |t|
    t.string   "name"
    t.integer  "province_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cities", ["province_id"], name: "index_cities_on_province_id", using: :btree

  create_table "districts", force: true do |t|
    t.string   "name"
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "districts", ["city_id"], name: "index_districts_on_city_id", using: :btree

  create_table "favor_users", force: true do |t|
    t.integer  "user_id"
    t.integer  "favor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.string   "name"
    t.float    "price",       limit: 24
    t.text     "description"
    t.integer  "user_id"
    t.integer  "sub_cat_id"
    t.integer  "payment_id"
    t.integer  "brand_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items", ["brand_id"], name: "index_items_on_brand_id", using: :btree
  add_index "items", ["payment_id"], name: "index_items_on_payment_id", using: :btree
  add_index "items", ["sub_cat_id"], name: "index_items_on_sub_cat_id", using: :btree
  add_index "items", ["user_id"], name: "index_items_on_user_id", using: :btree

  create_table "order_items", force: true do |t|
    t.integer  "order_id"
    t.integer  "item_id"
    t.float    "price",      limit: 24
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.integer  "buyer_user_id"
    t.text     "delivery_address"
    t.integer  "delivery_date_time"
    t.integer  "order_taken_date_time"
    t.text     "comment"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
    t.integer  "quantity"
    t.integer  "amount"
    t.integer  "pay_date_time"
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "payment_methods", force: true do |t|
    t.string   "payment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "provinces", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sub_cats", force: true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sub_cats", ["category_id"], name: "index_sub_cats_on_category_id", using: :btree

  create_table "user_finances", force: true do |t|
    t.integer  "overall_revenue"
    t.integer  "monthly_revenue"
    t.integer  "payable"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_finances", ["user_id"], name: "index_user_finances_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "pw"
    t.integer  "phone"
    t.string   "address1"
    t.string   "address2"
    t.integer  "postcode"
    t.integer  "city_id"
    t.boolean  "user_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "token"
  end

  add_index "users", ["city_id"], name: "index_users_on_city_id", using: :btree

end
