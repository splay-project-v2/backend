class Lock < ApplicationRecord
  validates :job_reservation, presence: true
end
