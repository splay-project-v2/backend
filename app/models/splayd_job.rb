class SplaydJob < ApplicationRecord
  belongs_to :job
  belongs_to :splayd

  enum status: %w[RESERVED WAITING RUNNING]

  validates :job_id, presence: true
  validates :splayd_id, presence: true
  validates :status, inclusion: %w[RESERVED WAITING RUNNING]
end
