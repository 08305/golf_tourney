class AddToUsersTable < ActiveRecord::Migration
  def change
    add_column :players, :host, :boolean, default: false
  end
end
