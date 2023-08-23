# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_08_23_134910) do

  create_table "accounts", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "chat_members", force: :cascade do |t|
    t.integer "chat_id"
    t.string "chatter_type", null: false
    t.integer "chatter_id", null: false
    t.boolean "archived", default: false
    t.integer "unread_count", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "group"
    t.index ["chatter_type", "chatter_id"], name: "index_chat_members_on_chatter"
  end

  create_table "chat_messages", force: :cascade do |t|
    t.integer "chat_id"
    t.integer "about_id"
    t.string "about_type"
    t.string "content"
    t.integer "sender_chat_member_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "sender_proxy_id"
    t.string "sender_proxy_type"
  end

  create_table "chat_recipient_receipts", force: :cascade do |t|
    t.integer "chat_member_id"
    t.integer "chat_message_id"
    t.datetime "read_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "chats", force: :cascade do |t|
    t.integer "messages_count"
    t.string "last_message_content"
    t.datetime "last_message_sent_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "chat_member_count", default: 0
    t.integer "about_id"
    t.string "about_type"
  end

  create_table "job_post_applications", force: :cascade do |t|
    t.integer "job_post_id"
    t.integer "provider_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "job_posts", force: :cascade do |t|
    t.integer "owner_id"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "created_by_user_id"
  end

  create_table "managers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "owner_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "non_clinical_job_applications", force: :cascade do |t|
    t.integer "non_clinical_job_post_id"
    t.integer "provider_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "non_clinical_job_posts", force: :cascade do |t|
    t.integer "vendor_id"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "owners", force: :cascade do |t|
    t.integer "account_id"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "providers", force: :cascade do |t|
    t.integer "account_id"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer "account_id"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "recruiter", default: false
  end

  create_table "vendors", force: :cascade do |t|
    t.integer "account_id"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
