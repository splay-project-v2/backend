class LocalLog < ApplicationRecord
  belongs_to :splayd
  belongs_to :job

  validates :splayd_id, presence: true
  validates :job_id, presence: true
end
