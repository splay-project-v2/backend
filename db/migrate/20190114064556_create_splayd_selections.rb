class CreateSplaydSelections < ActiveRecord::Migration[5.2]
  def change
    create_table :splayd_selections do |t|
      t.belongs_to :splayd
      t.belongs_to :job
      t.string :selected, limit: 5, default: "FALSE"
      t.integer :trace_number
      t.string :trace_status, limit: 7, default: "WAITING"
      t.string :reset, limit: 5, default: "FALSE"
      t.string :replied, limit: 5, default: "FALSE"
      t.decimal :reply_time, precision: 8, scale: 5
      t.integer :port, null: false, default: 0
    end

  end
end
