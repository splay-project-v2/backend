class CreateLocks < ActiveRecord::Migration[5.2]
  def change
    create_table :locks do |t|
      t.integer :job_reservation, default: 0, null: false
    end
  end
end
