class JobMandatorySplayd < ApplicationRecord
  belongs_to :job
  belongs_to :splayd

  validates :job_id, presence: true
  validates :splayd_id, presence: true
end
