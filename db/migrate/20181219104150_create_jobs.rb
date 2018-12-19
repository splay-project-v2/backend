class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :ref
      t.belongs_to :user
      t.timestamps

      t.string  :name
      t.string  :description

      t.string  :localization,              limit: 2
      t.integer :distance,                  limit: 11
      t.decimal :latitude,                  precision: 10, scale: 6
      t.decimal :longitude,                 precision: 10, scale: 6

      t.string  :bits,                      limit: 0,  default: "32",      null: false
      t.string  :endianness,                limit: 0,  default: "little",  null: false
      t.integer :max_mem,                   limit: 11, default: 2097152,   null: false
      t.integer :disk_max_size,             limit: 11, default: 67108864,  null: false
      t.integer :disk_max_files,            limit: 11, default: 512,       null: false
      t.integer :disk_max_file_descriptors, limit: 11, default: 32,        null: false
      t.integer :network_max_send,          limit: 14, default: 134217728, null: false
      t.integer :network_max_receive,       limit: 14, default: 134217728, null: false
      t.integer :network_max_sockets,       limit: 11, default: 32,        null: false
      t.integer :network_nb_ports,          limit: 11, default: 1,         null: false
      t.integer :network_send_speed,        limit: 11, default: 51200,     null: false
      t.integer :network_receive_speed,     limit: 11, default: 51200,     null: false
      t.decimal :udp_drop_ratio,            precision: 3, scale: 2, default: 0.0, null: false
      t.text    :code,                      null: false
      t.text    :script,                    null: false
      t.integer :nb_splayds,                limit: 11, default: 1, null: false
      t.decimal :factor,                    precision: 3, scale: 2, default: 1.25, null: false
      t.string  :splayd_version
      t.decimal :max_load,                  precision: 5, scale: 2, default: 999.99, null: false
      t.integer :min_uptime,                limit: 11, default: 0, null: false
      t.string  :hostmasks
      t.integer :max_time,                  limit: 11, default: 10000

      t.string  :die_free,                  limit: 0, default: "TRUE"
      t.string  :keep_files,                limit: 0, default: "FALSE"

      t.string  :scheduler,                 limit: 0, default: "standard"
      t.text    :scheduler_description

      t.string  :list_type,                 limit: 0, default: "HEAD"
      t.integer :list_size,                 limit: 11, default: 0, null: false

      t.string  :command
      t.text    :command_msg

      t.string  :status,                    limit: 0, default: "LOCAL"
      t.integer :status_time,               limit: 11, null: false
      t.text    :status_msg
    end

    add_index :jobs, :ref
  end
end
