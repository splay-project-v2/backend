class CreateJobMandatorySplayds < ActiveRecord::Migration[5.2]
  def change
    create_table :job_mandatory_splayds do |t|
      t.belongs_to :job
      t.belongs_to :splayd
      t.timestamps
    end
  end
end
