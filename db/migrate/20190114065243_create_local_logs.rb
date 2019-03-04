class CreateLocalLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :local_logs do |t|
      t.belongs_to :splayd
      t.belongs_to :job
      t.text :data
    end
  end
end
