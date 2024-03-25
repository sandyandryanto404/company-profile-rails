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

ActiveRecord::Schema[7.0].define(version: 2024_03_25_220332) do
  create_table "article_comments", charset: "latin1", force: :cascade do |t|
    t.bigint "parent_id"
    t.bigint "article_id", null: false
    t.bigint "user_id", null: false
    t.text "comment", size: :long, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_article_comments_on_article_id"
    t.index ["created_at"], name: "index_article_comments_on_created_at"
    t.index ["parent_id"], name: "index_article_comments_on_parent_id"
    t.index ["updated_at"], name: "index_article_comments_on_updated_at"
    t.index ["user_id"], name: "index_article_comments_on_user_id"
  end

  create_table "articles", charset: "latin1", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "image", limit: 191
    t.string "slug", null: false
    t.string "title", null: false
    t.text "description"
    t.text "content", size: :long
    t.integer "status", limit: 2, default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_at"], name: "index_articles_on_created_at"
    t.index ["image"], name: "index_articles_on_image"
    t.index ["slug"], name: "index_articles_on_slug"
    t.index ["status"], name: "index_articles_on_status"
    t.index ["title"], name: "index_articles_on_title"
    t.index ["updated_at"], name: "index_articles_on_updated_at"
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "articles_references", primary_key: ["article_id", "reference_id"], charset: "latin1", force: :cascade do |t|
    t.bigint "article_id", null: false
    t.bigint "reference_id", null: false
    t.index ["article_id"], name: "index_articles_references_on_article_id"
    t.index ["reference_id"], name: "index_articles_references_on_reference_id"
  end

  create_table "contacts", charset: "latin1", force: :cascade do |t|
    t.string "name", limit: 191
    t.string "email", limit: 191
    t.string "subject", limit: 191
    t.text "message"
    t.integer "status", limit: 2, default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_at"], name: "index_contacts_on_created_at"
    t.index ["email"], name: "index_contacts_on_email"
    t.index ["name"], name: "index_contacts_on_name"
    t.index ["status"], name: "index_contacts_on_status"
    t.index ["subject"], name: "index_contacts_on_subject"
    t.index ["updated_at"], name: "index_contacts_on_updated_at"
  end

  create_table "customers", charset: "latin1", force: :cascade do |t|
    t.string "image", limit: 191
    t.string "name", limit: 191, null: false
    t.string "phone", limit: 191, null: false
    t.string "email", limit: 191, null: false
    t.text "address"
    t.integer "sort", default: 0
    t.integer "status", limit: 2, default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_at"], name: "index_customers_on_created_at"
    t.index ["image"], name: "index_customers_on_image"
    t.index ["name"], name: "index_customers_on_name"
    t.index ["phone"], name: "index_customers_on_phone"
    t.index ["sort"], name: "index_customers_on_sort"
    t.index ["status"], name: "index_customers_on_status"
    t.index ["updated_at"], name: "index_customers_on_updated_at"
  end

  create_table "faqs", charset: "latin1", force: :cascade do |t|
    t.string "question"
    t.text "answer", null: false
    t.integer "sort", default: 0
    t.integer "status", limit: 2, default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_at"], name: "index_faqs_on_created_at"
    t.index ["question"], name: "index_faqs_on_question"
    t.index ["sort"], name: "index_faqs_on_sort"
    t.index ["status"], name: "index_faqs_on_status"
    t.index ["updated_at"], name: "index_faqs_on_updated_at"
  end

  create_table "login_attempts", charset: "latin1", force: :cascade do |t|
    t.string "ip_address"
    t.string "login"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ip_address"], name: "index_login_attempts_on_ip_address"
    t.index ["login"], name: "index_login_attempts_on_login"
  end

  create_table "portfolio_images", charset: "latin1", force: :cascade do |t|
    t.bigint "portfolio_id", null: false
    t.string "image", limit: 191, null: false
    t.integer "status", limit: 2, default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_at"], name: "index_portfolio_images_on_created_at"
    t.index ["image"], name: "index_portfolio_images_on_image"
    t.index ["portfolio_id"], name: "index_portfolio_images_on_portfolio_id"
    t.index ["status"], name: "index_portfolio_images_on_status"
    t.index ["updated_at"], name: "index_portfolio_images_on_updated_at"
  end

  create_table "portfolios", charset: "latin1", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.bigint "reference_id", null: false
    t.string "title", null: false
    t.text "description", size: :long, null: false
    t.date "project_date"
    t.text "project_url"
    t.integer "sort", default: 0
    t.integer "status", limit: 2, default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_at"], name: "index_portfolios_on_created_at"
    t.index ["customer_id"], name: "index_portfolios_on_customer_id"
    t.index ["project_date"], name: "index_portfolios_on_project_date"
    t.index ["reference_id"], name: "index_portfolios_on_reference_id"
    t.index ["sort"], name: "index_portfolios_on_sort"
    t.index ["status"], name: "index_portfolios_on_status"
    t.index ["title"], name: "index_portfolios_on_title"
    t.index ["updated_at"], name: "index_portfolios_on_updated_at"
  end

  create_table "references", charset: "latin1", force: :cascade do |t|
    t.string "slug", null: false
    t.string "name", null: false
    t.text "description"
    t.integer "type", default: 0
    t.integer "status", limit: 2, default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_at"], name: "index_references_on_created_at"
    t.index ["name"], name: "index_references_on_name"
    t.index ["slug"], name: "index_references_on_slug"
    t.index ["status"], name: "index_references_on_status"
    t.index ["type"], name: "index_references_on_type"
    t.index ["updated_at"], name: "index_references_on_updated_at"
  end

  create_table "roles", charset: "latin1", force: :cascade do |t|
    t.string "code", limit: 64, null: false
    t.string "name", limit: 191, null: false
    t.text "description"
    t.integer "status", limit: 2, default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_roles_on_code"
    t.index ["created_at"], name: "index_roles_on_created_at"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["status"], name: "index_roles_on_status"
    t.index ["updated_at"], name: "index_roles_on_updated_at"
  end

  create_table "services", charset: "latin1", force: :cascade do |t|
    t.string "icon", limit: 191
    t.string "title", limit: 191
    t.text "description"
    t.integer "sort", default: 0
    t.integer "status", limit: 2, default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_at"], name: "index_services_on_created_at"
    t.index ["icon"], name: "index_services_on_icon"
    t.index ["sort"], name: "index_services_on_sort"
    t.index ["status"], name: "index_services_on_status"
    t.index ["title"], name: "index_services_on_title"
    t.index ["updated_at"], name: "index_services_on_updated_at"
  end

  create_table "sliders", charset: "latin1", force: :cascade do |t|
    t.string "image", limit: 191
    t.string "title", limit: 191, null: false
    t.text "description"
    t.string "link", limit: 191, null: false
    t.integer "sort", default: 0
    t.integer "status", limit: 2, default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_at"], name: "index_sliders_on_created_at"
    t.index ["image"], name: "index_sliders_on_image"
    t.index ["link"], name: "index_sliders_on_link"
    t.index ["sort"], name: "index_sliders_on_sort"
    t.index ["status"], name: "index_sliders_on_status"
    t.index ["title"], name: "index_sliders_on_title"
    t.index ["updated_at"], name: "index_sliders_on_updated_at"
  end

  create_table "teams", charset: "latin1", force: :cascade do |t|
    t.string "image", limit: 191
    t.string "name", limit: 191, null: false
    t.string "email", limit: 191, null: false
    t.string "position_name", limit: 191, null: false
    t.string "phone", limit: 191, null: false
    t.string "twitter", limit: 191
    t.string "facebook", limit: 191
    t.string "instagram", limit: 191
    t.string "linked_in", limit: 191
    t.text "address"
    t.integer "sort", default: 0
    t.integer "status", limit: 2, default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_at"], name: "index_teams_on_created_at"
    t.index ["email"], name: "index_teams_on_email"
    t.index ["facebook"], name: "index_teams_on_facebook"
    t.index ["image"], name: "index_teams_on_image"
    t.index ["instagram"], name: "index_teams_on_instagram"
    t.index ["linked_in"], name: "index_teams_on_linked_in"
    t.index ["name"], name: "index_teams_on_name"
    t.index ["position_name"], name: "index_teams_on_position_name"
    t.index ["sort"], name: "index_teams_on_sort"
    t.index ["status"], name: "index_teams_on_status"
    t.index ["twitter"], name: "index_teams_on_twitter"
    t.index ["updated_at"], name: "index_teams_on_updated_at"
  end

  create_table "testimonials", charset: "latin1", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.string "image", limit: 191
    t.string "name", limit: 191, null: false
    t.string "position", limit: 191, null: false
    t.text "quote", null: false
    t.integer "sort", default: 0
    t.integer "status", limit: 2, default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_at"], name: "index_testimonials_on_created_at"
    t.index ["customer_id"], name: "index_testimonials_on_customer_id"
    t.index ["image"], name: "index_testimonials_on_image"
    t.index ["name"], name: "index_testimonials_on_name"
    t.index ["position"], name: "index_testimonials_on_position"
    t.index ["sort"], name: "index_testimonials_on_sort"
    t.index ["status"], name: "index_testimonials_on_status"
    t.index ["updated_at"], name: "index_testimonials_on_updated_at"
  end

  create_table "users", charset: "latin1", force: :cascade do |t|
    t.string "image", limit: 64
    t.string "first_name", limit: 64
    t.string "last_name", limit: 191
    t.string "gender", limit: 2
    t.string "country", limit: 64
    t.string "province", limit: 191
    t.string "postal_code", limit: 191
    t.string "birth_place", limit: 191
    t.date "birth_date"
    t.string "twitter", limit: 191
    t.string "facebook", limit: 191
    t.string "instagram", limit: 191
    t.text "address"
    t.text "about_me"
    t.string "username", limit: 191, null: false
    t.string "email", limit: 191, null: false
    t.string "phone", limit: 20
    t.string "password_digest"
    t.integer "status", limit: 2, default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["birth_place"], name: "index_users_on_birth_place"
    t.index ["country"], name: "index_users_on_country"
    t.index ["created_at"], name: "index_users_on_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["facebook"], name: "index_users_on_facebook"
    t.index ["first_name"], name: "index_users_on_first_name"
    t.index ["gender"], name: "index_users_on_gender"
    t.index ["image"], name: "index_users_on_image"
    t.index ["instagram"], name: "index_users_on_instagram"
    t.index ["last_name"], name: "index_users_on_last_name"
    t.index ["password_digest"], name: "index_users_on_password_digest"
    t.index ["phone"], name: "index_users_on_phone", unique: true
    t.index ["postal_code"], name: "index_users_on_postal_code"
    t.index ["province"], name: "index_users_on_province"
    t.index ["status"], name: "index_users_on_status"
    t.index ["twitter"], name: "index_users_on_twitter"
    t.index ["updated_at"], name: "index_users_on_updated_at"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "users_notifications", charset: "latin1", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "subject", limit: 191, null: false
    t.string "description", null: false
    t.text "content", size: :long
    t.integer "status", limit: 2, default: 0
    t.datetime "expired_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_at"], name: "index_users_notifications_on_created_at"
    t.index ["description"], name: "index_users_notifications_on_description"
    t.index ["expired_at"], name: "index_users_notifications_on_expired_at"
    t.index ["subject"], name: "index_users_notifications_on_subject"
    t.index ["updated_at"], name: "index_users_notifications_on_updated_at"
    t.index ["user_id"], name: "index_users_notifications_on_user_id"
  end

  create_table "users_password_resets", charset: "latin1", force: :cascade do |t|
    t.string "email", limit: 64, null: false
    t.string "token", limit: 191, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_at"], name: "index_users_password_resets_on_created_at"
    t.index ["email"], name: "index_users_password_resets_on_email"
    t.index ["token"], name: "index_users_password_resets_on_token"
    t.index ["updated_at"], name: "index_users_password_resets_on_updated_at"
  end

  create_table "users_roles", primary_key: ["user_id", "role_id"], charset: "latin1", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "role_id", null: false
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  create_table "users_verifications", charset: "latin1", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "token", limit: 191, null: false
    t.integer "status", limit: 2, default: 0
    t.datetime "expired_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_at"], name: "index_users_verifications_on_created_at"
    t.index ["expired_at"], name: "index_users_verifications_on_expired_at"
    t.index ["status"], name: "index_users_verifications_on_status"
    t.index ["token"], name: "index_users_verifications_on_token"
    t.index ["updated_at"], name: "index_users_verifications_on_updated_at"
    t.index ["user_id"], name: "index_users_verifications_on_user_id"
  end

  add_foreign_key "article_comments", "article_comments", column: "parent_id"
  add_foreign_key "article_comments", "articles"
  add_foreign_key "article_comments", "users"
  add_foreign_key "articles", "users"
  add_foreign_key "articles_references", "articles"
  add_foreign_key "articles_references", "references"
  add_foreign_key "portfolio_images", "portfolios"
  add_foreign_key "portfolios", "customers"
  add_foreign_key "portfolios", "references"
  add_foreign_key "testimonials", "customers"
  add_foreign_key "users_notifications", "users"
  add_foreign_key "users_roles", "roles"
  add_foreign_key "users_roles", "users"
  add_foreign_key "users_verifications", "users"
end
