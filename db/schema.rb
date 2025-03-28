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

ActiveRecord::Schema[7.2].define(version: 2025_02_06_074048) do
  create_table "meal_types", charset: "utf8mb4", collation: "utf8mb4_uca1400_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.index ["name"], name: "index_meal_types_on_name", unique: true
  end

  create_table "meals", charset: "utf8mb4", collation: "utf8mb4_uca1400_ai_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "portion"
    t.bigint "meal_type_id", null: false
    t.bigint "product_id", null: false
    t.bigint "user_id", null: false
    t.index ["meal_type_id"], name: "index_meals_on_meal_type_id"
    t.index ["product_id"], name: "index_meals_on_product_id"
    t.index ["user_id"], name: "index_meals_on_user_id"
  end

  create_table "product_types", charset: "utf8mb4", collation: "utf8mb4_uca1400_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.index ["name"], name: "index_product_types_on_name", unique: true
  end

  create_table "products", charset: "utf8mb4", collation: "utf8mb4_uca1400_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.integer "kcal", null: false
    t.integer "fat", null: false
    t.integer "carbohydrates", null: false
    t.integer "proteins", null: false
    t.bigint "product_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.boolean "active", default: true, null: false
    t.index ["name"], name: "index_products_on_name", unique: true
    t.index ["product_type_id"], name: "index_products_on_product_type_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_uca1400_ai_ci", force: :cascade do |t|
    t.string "firstname", null: false
    t.string "lastname", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "weights", charset: "utf8mb4", collation: "utf8mb4_uca1400_ai_ci", force: :cascade do |t|
    t.integer "weight", null: false
    t.date "date", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_weights_on_user_id"
  end
end
