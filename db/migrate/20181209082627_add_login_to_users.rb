# frozen_string_literal: true

class AddLoginToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :login, :string

    add_index :users, :login, unique: true
  end
end
