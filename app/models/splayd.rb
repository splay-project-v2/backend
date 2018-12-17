class Splayd < ApplicationRecord
  belongs_to :user
  has_many :splayd_availabilities, dependent: :nullify

  enum bits:       %w[64 32]
  enum endianness: %w[big little]
  enum command:    %w[DELETE]
  enum status:     %w[REGISTERED PREAVAILABLE AVAILABLE UNAVAILABLE RESET DELETED]

  validates :key, presence: true
  validates :bits,       inclusion: %w[64 32]
  validates :endianness, inclusion: %w[big little]
  validates :command,    inclusion: %w[DELETE]
  validates :status,     inclusion: %w[REGISTERED PREAVAILABLE AVAILABLE UNAVAILABLE RESET DELETED]
end
