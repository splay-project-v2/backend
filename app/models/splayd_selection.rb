class SplaydSelection < ApplicationRecord
  belongs_to :splayd
  belongs_to :job

  enum selected: %w[TRUE FALSE], _prefix: :selected
  enum trace_status: %w[RUNNING WAITING]
  enum reset: %w[TRUE FALSE], _prefix: :reset
  enum replied: %w[TRUE FALSE], _prefix: :replied

  validates :splayd_id, presence: true
  validates :job_id, presence: true
  validates :port, presence: true
  validates :selected, inclusion: %w[TRUE FALSE]
  validates :trace_status, inclusion: %w[RUNNING WAITING]
  validates :reset, inclusion: %w[TRUE FALSE]
  validates :replied, inclusion: %w[TRUE FALSE]

  attribute :port, default: 11_000
  attribute :selected, default: 'FALSE'
  attribute :trace_status, default: 'WAITING'
  attribute :reset, default: 'FALSE'
  attribute :replied, default: 'FALSE'
end
