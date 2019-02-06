class Action < ApplicationRecord
  belongs_to :splayd
  belongs_to :job

  validates :splayd_id, presence: true
  validates :job_id, presence: true
  validates :status, inclusion: %w[TEMP WAITING SENDING FAILURE]

  attribute :status, default: 'WAITING'
end
