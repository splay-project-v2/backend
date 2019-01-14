class CreateSplaydJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :splayd_jobs do |t|
      t.belongs_to :job
      t.belongs_to :splayd
      t.string  "status", limit: 0,  default: "RESERVED"
      t.timestamps
    end
  end
end
