class CreateBlacklistHosts < ActiveRecord::Migration[5.2]
  def change
    create_table :blacklist_hosts do |t|
      t.string :host
    end
  end
end
