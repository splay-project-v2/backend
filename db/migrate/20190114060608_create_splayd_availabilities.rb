class CreateSplaydAvailabilities < ActiveRecord::Migration[5.2]
  def change
    create_table :splayd_availabilities do |t|
      t.belongs_to :splayd
      t.string :ip
      t.string :status, default: 'AVAILABLE'
      t.integer :time, null: false
    end
  end
end
