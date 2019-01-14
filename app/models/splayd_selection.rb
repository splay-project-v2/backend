class SplaydSelection < ApplicationRecord
  belongs_to :splayd
  belongs_to :job

  enum selected: %w[TRUE FALSE]
  enum trace_status: %w[RUNNING WAITING]
  enum reset: %w[TRUE FALSE]
  enum replied: %w[TRUE FALSE]

  validates :splayd_id, presence: true
  validates :job_id, presence: true
  validates :port, presence: true
  validates :selected, inclusion: %w[TRUE FALSE]
  validates :trace_status, inclusion: %w[RUNNING WAITING]
  validates :reset, inclusion: %w[TRUE FALSE]
  validates :replied, inclusion: %w[TRUE FALSE]
end
