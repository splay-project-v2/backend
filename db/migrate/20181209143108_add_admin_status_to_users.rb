class AddAdminStatusToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :admin, :integer, default: 0, null: false
  end
end
