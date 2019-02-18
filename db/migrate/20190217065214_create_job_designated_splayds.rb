class CreateJobDesignatedSplayds < ActiveRecord::Migration[5.2]
  def change
    create_table :job_designated_splayds do |t|
      t.belongs_to :job
      t.belongs_to :splayd
    end
  end
end
