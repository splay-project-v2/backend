class Action < ApplicationRecord
  belongs_to :splayd
  belongs_to :job

  enum status: %w[TEMP WAITING SENDING FAILURE]

  validates :splayd_id, presence: true
  validates :job_id, presence: true
  validates :status, inclusion: %w[TEMP WAITING SENDING FAILURE]
end
