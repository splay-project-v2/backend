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

ActiveRecord::Schema.define(version: 2018_12_19_104150) do

  create_table "jobs", force: :cascade do |t|
    t.string "ref"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "description"
    t.string "localization", limit: 2
    t.integer "distance", limit: 11
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
    t.string "bits", limit: 0, default: "32", null: false
    t.string "endianness", limit: 0, default: "little", null: false
    t.integer "max_mem", limit: 11, default: 2097152, null: false
    t.integer "disk_max_size", limit: 11, default: 67108864, null: false
    t.integer "disk_max_files", limit: 11, default: 512, null: false
    t.integer "disk_max_file_descriptors", limit: 11, default: 32, null: false
    t.integer "network_max_send", limit: 14, default: 134217728, null: false
    t.integer "network_max_receive", limit: 14, default: 134217728, null: false
    t.integer "network_max_sockets", limit: 11, default: 32, null: false
    t.integer "network_nb_ports", limit: 11, default: 1, null: false
    t.integer "network_send_speed", limit: 11, default: 51200, null: false
    t.integer "network_receive_speed", limit: 11, default: 51200, null: false
    t.decimal "udp_drop_ratio", precision: 3, scale: 2, default: "0.0", null: false
    t.text "code", null: false
    t.text "script", null: false
    t.integer "nb_splayds", limit: 11, default: 1, null: false
    t.decimal "factor", precision: 3, scale: 2, default: "1.25", null: false
    t.string "splayd_version"
    t.decimal "max_load", precision: 5, scale: 2, default: "999.99", null: false
    t.integer "min_uptime", limit: 11, default: 0, null: false
    t.string "hostmasks"
    t.integer "max_time", limit: 11, default: 10000
    t.string "die_free", limit: 0, default: "TRUE"
    t.string "keep_files", limit: 0, default: "FALSE"
    t.string "scheduler", limit: 0, default: "standard"
    t.text "scheduler_description"
    t.string "list_type", limit: 0, default: "HEAD"
    t.integer "list_size", limit: 11, default: 0, null: false
    t.string "command"
    t.text "command_msg"
    t.string "status", limit: 0, default: "LOCAL"
    t.integer "status_time", limit: 11, null: false
    t.text "status_msg"
    t.index ["ref"], name: "index_jobs_on_ref"
    t.index ["user_id"], name: "index_jobs_on_user_id"
  end

  create_table "splayd_availabilities", force: :cascade do |t|
    t.integer "splayd_id"
    t.string "ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "AVAILABLE"
    t.integer "time", null: false
    t.index ["splayd_id"], name: "index_splayd_availabilities_on_splayd_id"
  end

  create_table "splayds", force: :cascade do |t|
    t.string "key", null: false
    t.string "ip"
    t.string "hostname"
    t.string "session"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "country", limit: 2
    t.string "city"
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
    t.string "version"
    t.string "lua_version"
    t.string "bits", limit: 0, default: "32"
    t.string "endianness", limit: 0, default: "little"
    t.string "os"
    t.string "full_os"
    t.integer "start_time", limit: 11
    t.decimal "load_1", precision: 5, scale: 2, default: "999.99"
    t.decimal "load_5", precision: 5, scale: 2, default: "999.99"
    t.decimal "load_15", precision: 5, scale: 2, default: "999.99"
    t.integer "max_number", limit: 11
    t.integer "max_mem", limit: 11
    t.integer "disk_max_size", limit: 11
    t.integer "disk_max_files", limit: 11
    t.integer "disk_max_file_descriptors", limit: 11
    t.integer "network_max_send", limit: 14
    t.integer "network_max_receive", limit: 14
    t.integer "network_max_sockets", limit: 11
    t.integer "network_max_ports", limit: 11
    t.integer "network_send_speed", limit: 11
    t.integer "network_receive_speed", limit: 11
    t.string "command", limit: 0
    t.string "status", limit: 0, default: "REGISTERED"
    t.integer "last_contact_time", limit: 11
    t.integer "user_id"
    t.index ["ip"], name: "index_splayds_on_ip"
    t.index ["key"], name: "index_splayds_on_key"
    t.index ["user_id"], name: "index_splayds_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "login"
    t.integer "admin", default: 0, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["login"], name: "index_users_on_login", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
