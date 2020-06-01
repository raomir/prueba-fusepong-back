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

ActiveRecord::Schema.define(version: 2020_05_30_225015) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categoria", force: :cascade do |t|
    t.string "nombre", limit: 150
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categoria_productos", force: :cascade do |t|
    t.bigint "producto_id"
    t.bigint "categorium_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["categorium_id"], name: "index_categoria_productos_on_categorium_id"
    t.index ["producto_id"], name: "index_categoria_productos_on_producto_id"
  end

  create_table "marcas", force: :cascade do |t|
    t.string "nombre", limit: 150
    t.string "descripcion", limit: 500
    t.string "slogan", limit: 150
    t.string "ciudad", limit: 150
    t.string "departamento", limit: 150
    t.string "pais", limit: 150
    t.boolean "visible"
    t.string "color_principal", limit: 150
    t.string "color_secundario", limit: 150
    t.json "social_media"
    t.string "email"
    t.integer "radio_de_cobertura"
    t.bigint "categorium_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["categorium_id"], name: "index_marcas_on_categorium_id"
  end

  create_table "productos", force: :cascade do |t|
    t.string "nombre", limit: 150
    t.string "tipo_producto", limit: 150
    t.string "descripcion", limit: 500
    t.boolean "visible"
    t.float "score"
    t.string "referencia", limit: 150
    t.float "precio"
    t.integer "cantidad"
    t.boolean "on_sale"
    t.float "precio_anterior"
    t.json "composicion"
    t.bigint "marca_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["marca_id"], name: "index_productos_on_marca_id"
  end

  add_foreign_key "categoria_productos", "categoria"
  add_foreign_key "categoria_productos", "productos"
  add_foreign_key "marcas", "categoria"
  add_foreign_key "productos", "marcas"
end
