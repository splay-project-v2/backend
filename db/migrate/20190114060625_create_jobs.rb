class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :ref
      t.belongs_to :user
      t.timestamps

      t.string  :name
      t.string  :description

      t.string  :localization,              limit: 2
      t.integer :distance,                  limit: 4
      t.decimal :latitude,                  precision: 10, scale: 6
      t.decimal :longitude,                 precision: 10, scale: 6

      t.string  :bits,                      default: "32",      null: false
      t.string  :endianness,                default: "little",  null: false
      t.integer :max_mem,                   limit: 4, default: 2097152,   null: false
      t.integer :disk_max_size,             limit: 4, default: 67108864,  null: false
      t.integer :disk_max_files,            limit: 4, default: 512,       null: false
      t.integer :disk_max_file_descriptors, limit: 4, default: 32,        null: false
      t.integer :network_max_send,          limit: 8, default: 134217728, null: false
      t.integer :network_max_receive,       limit: 8, default: 134217728, null: false
      t.integer :network_max_sockets,       limit: 4, default: 32,        null: false
      t.integer :network_nb_ports,          limit: 4, default: 1,         null: false
      t.integer :network_send_speed,        limit: 4, default: 51200,     null: false
      t.integer :network_receive_speed,     limit: 4, default: 51200,     null: false
      t.decimal :udp_drop_ratio,            precision: 3, scale: 2, default: 0.0, null: false
      t.text    :code,                      null: false
      t.text    :script,                    null: false
      t.integer :nb_splayds,                limit: 4, default: 1, null: false
      t.decimal :factor,                    precision: 3, scale: 2, default: 1.25, null: false
      t.string  :splayd_version
      t.decimal :max_load,                  precision: 5, scale: 2, default: 999.99, null: false
      t.integer :min_uptime,                limit: 4, default: 0, null: false
      t.string  :hostmasks
      t.integer :max_time,                  limit: 4, default: 10000

      t.string  :die_free,                  default: "TRUE"
      t.string  :keep_files,                default: "FALSE"

      t.string  :scheduler,                 default: "standard"
      t.text    :scheduler_description

      t.string  :list_type,                 default: "HEAD"
      t.integer :list_size,                 limit: 4, default: 0, null: false

      t.string  :command
      t.text    :command_msg

      t.string  :status,                    default: "LOCAL"
      t.integer :status_time,               limit: 4, null: false
      t.text    :status_msg

      # > v1.0.7 controller ----
      t.datetime :scheduled_at
      t.string :strict, :default => "FALSE"
      t.text :topology
      t.integer :queue_timeout
      # ----
    end

    add_index :jobs, :ref
  end
end
