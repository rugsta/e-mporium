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

ActiveRecord::Schema.define(version: 20150303051421) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cart_line_items", force: true do |t|
    t.integer  "cart_id"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "carts", force: true do |t|
    t.string   "user_id"
    t.string   "ip_address"
    t.string   "express_tokenID"
    t.string   "express_payerID"
    t.boolean  "checked_out",     default: false
    t.string   "invoiceNo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "category_name"
    t.boolean  "active",        default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", force: true do |t|
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "image_default"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
  end

  create_table "orders", force: true do |t|
    t.integer  "cart_id"
    t.string   "ip_address"
    t.string   "transactionID"
    t.string   "checkout_status"
    t.string   "correlationID"
    t.string   "version"
    t.string   "build"
    t.string   "transaction_type"
    t.string   "payment_type"
    t.string   "payment_date"
    t.string   "payment_status"
    t.string   "pending_reason"
    t.string   "gross_amount_currency_id"
    t.string   "gross_amount"
    t.string   "fee_amount"
    t.string   "net_amount"
    t.string   "express_tokenID"
    t.string   "secure_merchant_account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "product_name"
    t.integer  "category_id"
    t.text     "note"
    t.boolean  "archived"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "price",        precision: 8, scale: 2
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
