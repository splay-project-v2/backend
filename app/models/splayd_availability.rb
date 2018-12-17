class SplaydAvailability < ApplicationRecord
  belongs_to :splayd

  enum status: %w[AVAILABLE UNAVAILABLE RESET]

  validates :status, inclusion: %w[AVAILABLE UNAVAILABLE RESET]
  validates :splayd_id, presence: true
  validates :time, presence: true
end
