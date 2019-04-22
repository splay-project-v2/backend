class CreateSplayds < ActiveRecord::Migration[5.2]
  def change
    create_table :splayds do |t|
      t.string  :key, null: false
      t.string  :ip
      t.string  :hostname
      t.string  :session
      t.string  :name

      t.string  :country                   
      t.string  :city
      t.decimal :latitude,                  :precision => 10, :scale => 6
      t.decimal :longitude,                 :precision => 10, :scale => 6

      t.string  :version
      t.string  :lua_version
      t.string  :bits,                      :default => "32"
      t.string  :endianness,                :default => "little"
      t.string  :os
      t.string  :full_os
      t.integer :start_time,                :limit => 8

      t.string :architecture

      t.decimal :load_1,                    :precision => 5, :scale => 2, :default => 999.99
      t.decimal :load_5,                    :precision => 5, :scale => 2, :default => 999.99
      t.decimal :load_15,                   :precision => 5, :scale => 2, :default => 999.99

      t.integer :max_number,                :limit => 4
      t.integer :max_mem,                   :limit => 4
      t.integer :disk_max_size,             :limit => 4
      t.integer :disk_max_files,            :limit => 4
      t.integer :disk_max_file_descriptors, :limit => 4
      t.integer :network_max_send,          :limit => 8
      t.integer :network_max_receive,       :limit => 8
      t.integer :network_max_sockets,       :limit => 4
      t.integer :network_max_ports,         :limit => 4
      t.integer :network_send_speed,        :limit => 4
      t.integer :network_receive_speed,     :limit => 4
      t.string  :command                  

      t.string  :status,                    :default => "REGISTERED"
      t.integer :last_contact_time,         :limit => 4

      t.belongs_to :user
    end

    add_index :splayds, :ip
    add_index :splayds, :key
  end
end
