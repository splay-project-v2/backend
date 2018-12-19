class Job < ApplicationRecord
  belongs_to :user

  enum bits:       %w[64 32]
  enum endianness: %w[little big]
  enum die_free:   %w[TRUE FALSE]
  enum keep_files: %w[TRUE FALSE]
  enum scheduler:  %w[standard trace]
  enum list_type:  %w[HEAD RANDOM]
  enum status:     %w[LOCAL REGISTERING RUNNING NO_RESSOURCES REGISTER_TIMEOUT KILLED]

  validates :ref, presence: true
  validates :user_id, presence: true
  validates :bits, presence: true, inclusion: %w[64 32]
  validates :endianness, presence: true, inclusion: %w[little big]
  validates :max_mem, presence: true
  validates :disk_max_size, presence: true
  validates :disk_max_files, presence: true
  validates :disk_max_file_descriptors, presence: true
  validates :network_max_send, presence: true
  validates :network_max_receive, presence: true
  validates :network_max_sockets, presence: true
  validates :network_nb_ports, presence: true
  validates :network_send_speed, presence: true
  validates :network_receive_speed, presence: true
  validates :udp_drop_ratio, presence: true
  validates :code, presence: true
  validates :script, presence: true
  validates :nb_splayds, presence: true
  validates :factor, presence: true
  validates :max_load, presence: true
  validates :min_uptime, presence: true
  validates :die_free, inclusion: %w[TRUE FALSE]
  validates :keep_files, inclusion: %w[TRUE FALSE]
  validates :scheduler, inclusion: %w[standard trace]
  validates :list_type, inclusion: %w[HEAD RANDOM]
  validates :list_size, presence: true
  validates :status, inclusion: %w[LOCAL REGISTERING RUNNING NO_RESSOURCES REGISTER_TIMEOUT KILLED]
end
