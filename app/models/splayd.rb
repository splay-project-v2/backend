class Splayd < ApplicationRecord
  belongs_to :user
  has_many :splayd_availabilities, dependent: :nullify
  has_many :job_mandatory_splayds, dependent: :nullify
  has_many :splayd_jobs, dependent: :nullify

  validates :key, presence: true
  validates :bits,       inclusion: %w[64 32]
  validates :endianness, inclusion: %w[big little]
  validates :command,    inclusion: %w[DELETE], allow_blank: true
  validates :status,     inclusion: %w[REGISTERED PREAVAILABLE AVAILABLE UNAVAILABLE RESET DELETED]

  attribute :bits, default: '32'
  attribute :endianness, default: 'little'
  attribute :status, default: 'REGISTERED'
end
