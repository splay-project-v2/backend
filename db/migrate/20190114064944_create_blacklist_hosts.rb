class CreateBlacklistHosts < ActiveRecord::Migration[5.2]
  def change
    create_table :blacklist_hosts do |t|
      t.string :host
      t.timestamps
    end
  end
end
