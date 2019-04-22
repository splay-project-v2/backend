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

ActiveRecord::Schema.define(version: 2019_02_17_065214) do

  create_table "actions", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "splayd_id"
    t.bigint "job_id"
    t.string "command"
    t.text "data"
    t.string "status", limit: 7, default: "WAITING"
    t.integer "position"
    t.index ["job_id"], name: "index_actions_on_job_id"
    t.index ["splayd_id"], name: "index_actions_on_splayd_id"
  end

  create_table "blacklist_hosts", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "host"
  end

  create_table "job_designated_splayds", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "job_id"
    t.bigint "splayd_id"
    t.index ["job_id"], name: "index_job_designated_splayds_on_job_id"
    t.index ["splayd_id"], name: "index_job_designated_splayds_on_splayd_id"
  end

  create_table "job_mandatory_splayds", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "job_id"
    t.bigint "splayd_id"
    t.index ["job_id"], name: "index_job_mandatory_splayds_on_job_id"
    t.index ["splayd_id"], name: "index_job_mandatory_splayds_on_splayd_id"
  end

  create_table "jobs", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "ref"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "description"
    t.string "localization", limit: 2
    t.integer "distance"
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
    t.string "bits", default: "32", null: false
    t.string "endianness", default: "little", null: false
    t.integer "max_mem", default: 2097152, null: false
    t.integer "disk_max_size", default: 67108864, null: false
    t.integer "disk_max_files", default: 512, null: false
    t.integer "disk_max_file_descriptors", default: 32, null: false
    t.bigint "network_max_send", default: 134217728, null: false
    t.bigint "network_max_receive", default: 134217728, null: false
    t.integer "network_max_sockets", default: 32, null: false
    t.integer "network_nb_ports", default: 1, null: false
    t.integer "network_send_speed", default: 51200, null: false
    t.integer "network_receive_speed", default: 51200, null: false
    t.decimal "udp_drop_ratio", precision: 3, scale: 2, default: "0.0", null: false
    t.text "code", null: false
    t.text "script", null: false
    t.integer "nb_splayds", default: 1, null: false
    t.decimal "factor", precision: 3, scale: 2, default: "1.25", null: false
    t.string "splayd_version"
    t.decimal "max_load", precision: 5, scale: 2, default: "999.99", null: false
    t.integer "min_uptime", default: 0, null: false
    t.string "hostmasks"
    t.integer "max_time", default: 10000
    t.string "die_free", default: "TRUE"
    t.string "keep_files", default: "FALSE"
    t.string "scheduler", default: "standard"
    t.text "scheduler_description"
    t.string "list_type", default: "HEAD"
    t.integer "list_size", default: 0, null: false
    t.string "command"
    t.text "command_msg"
    t.string "status", default: "LOCAL"
    t.integer "status_time", null: false
    t.text "status_msg"
    t.datetime "scheduled_at"
    t.string "strict", default: "FALSE"
    t.text "topology"
    t.integer "queue_timeout"
    t.index ["ref"], name: "index_jobs_on_ref"
    t.index ["user_id"], name: "index_jobs_on_user_id"
  end

  create_table "local_logs", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "splayd_id"
    t.bigint "job_id"
    t.text "data"
    t.index ["job_id"], name: "index_local_logs_on_job_id"
    t.index ["splayd_id"], name: "index_local_logs_on_splayd_id"
  end

  create_table "locks", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "job_reservation", default: 0, null: false
  end

  create_table "splayd_availabilities", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "splayd_id"
    t.string "ip"
    t.string "status", default: "AVAILABLE"
    t.integer "time", null: false
    t.index ["splayd_id"], name: "index_splayd_availabilities_on_splayd_id"
  end

  create_table "splayd_jobs", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "job_id"
    t.bigint "splayd_id"
    t.string "status", default: "RESERVED"
    t.index ["job_id"], name: "index_splayd_jobs_on_job_id"
    t.index ["splayd_id"], name: "index_splayd_jobs_on_splayd_id"
  end

  create_table "splayd_selections", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "splayd_id"
    t.bigint "job_id"
    t.string "selected", limit: 5, default: "FALSE"
    t.integer "trace_number"
    t.string "trace_status", limit: 7, default: "WAITING"
    t.string "reset", limit: 5, default: "FALSE"
    t.string "replied", limit: 5, default: "FALSE"
    t.decimal "reply_time", precision: 8, scale: 5
    t.integer "port", default: 0, null: false
    t.index ["job_id"], name: "index_splayd_selections_on_job_id"
    t.index ["splayd_id"], name: "index_splayd_selections_on_splayd_id"
  end

  create_table "splayds", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "key", null: false
    t.string "ip"
    t.string "hostname"
    t.string "session"
    t.string "name"
    t.string "country"
    t.string "city"
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
    t.string "version"
    t.string "lua_version"
    t.string "bits", default: "32"
    t.string "endianness", default: "little"
    t.string "os"
    t.string "full_os"
    t.bigint "start_time"
    t.string "architecture"
    t.decimal "load_1", precision: 5, scale: 2, default: "999.99"
    t.decimal "load_5", precision: 5, scale: 2, default: "999.99"
    t.decimal "load_15", precision: 5, scale: 2, default: "999.99"
    t.integer "max_number"
    t.integer "max_mem"
    t.integer "disk_max_size"
    t.integer "disk_max_files"
    t.integer "disk_max_file_descriptors"
    t.bigint "network_max_send"
    t.bigint "network_max_receive"
    t.integer "network_max_sockets"
    t.integer "network_max_ports"
    t.integer "network_send_speed"
    t.integer "network_receive_speed"
    t.string "command"
    t.string "status", default: "REGISTERED"
    t.integer "last_contact_time"
    t.bigint "user_id"
    t.index ["ip"], name: "index_splayds_on_ip"
    t.index ["key"], name: "index_splayds_on_key"
    t.index ["user_id"], name: "index_splayds_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
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
    t.string "username"
    t.integer "admin", default: 0, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
