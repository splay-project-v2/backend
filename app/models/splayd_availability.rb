class SplaydAvailability < ApplicationRecord
  belongs_to :splayd

  enum status: %w[AVAILABLE UNAVAILABLE RESET]

  validates :status, inclusion: %w[AVAILABLE UNAVAILABLE RESET]
  validates :splayd_id, presence: true
  validates :time, presence: true

  attribute :status, default: 'AVAILABLE'
  attribute :time, default: Time.now.to_i
end
