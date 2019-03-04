class CreateSplaydJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :splayd_jobs do |t|
      t.belongs_to :job
      t.belongs_to :splayd
      t.string  "status",  default: "RESERVED"
    end
  end
end
