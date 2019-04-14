class Job < ApplicationRecord
  belongs_to :user
  has_many :job_mandatory_splayds, dependent: :nullify
  has_many :splayd_jobs, dependent: :nullify
  before_create :format_code, :check_splayds

  validates_with JobValidator
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
  validates :script, presence: true, allow_blank: true
  validates :nb_splayds, presence: true
  validates :factor, presence: true
  validates :max_load, presence: true
  validates :min_uptime, presence: true
  validates :die_free, inclusion: %w[TRUE FALSE]
  validates :keep_files, inclusion: %w[TRUE FALSE]
  validates :scheduler, inclusion: %w[standard trace tracealt]
  validates :list_type, inclusion: %w[HEAD RANDOM]
  validates :list_size, presence: true
  validates :status, inclusion: %w[LOCAL REGISTERING RUNNING NO_RESSOURCES REGISTER_TIMEOUT KILLED]

  attribute :ref, default: Digest::MD5.hexdigest(rand(1_000_000).to_s)
  attribute :bits, default: '32'
  attribute :endianness, default: 'little'
  attribute :die_free, default: 'TRUE'
  attribute :keep_files, default: 'FALSE'
  attribute :scheduler, default: 'standard'
  attribute :list_type, default: 'HEAD'
  attribute :status, default: 'LOCAL'
  attribute :script, default: ''
  attribute :status_time, default: Time.now.to_i

  def format_code
    self.code = code.to_s.gsub(/\\/, '\\\\\\').gsub(/'/, "\\\\'").gsub(/"/, '\\"')
  end

  def check_splayds
    self.nb_splayds = Splayd.count if nb_splayds > Splayd.count
  end

  def hosts
    spd_sel = SplaydSelection.where(job_id: id, selected: 'TRUE')
    splayds = []
    spd_sel.each do |sel|
      splayds.push(Splayd.find(sel.splayd_id).as_json.merge(port: sel.port))
    end
    splayds
  end
end
