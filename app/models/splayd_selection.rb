class SplaydSelection < ApplicationRecord
  belongs_to :splayd
  belongs_to :job

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
