class JobValidator < ActiveModel::Validator
  def validate(record)
    record.errors[:base] << 'No Splayd available' if Splayd.all.count < 1
  end
end
