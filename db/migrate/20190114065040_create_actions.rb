class CreateActions < ActiveRecord::Migration[5.2]
  def change
    create_table :actions do |t|
      t.belongs_to :splayd
      t.belongs_to :job
      t.string :command
      t.text :data
      t.string :status, limit: 7, default: "WAITING"
      t.integer :position
    end
  end
end
