class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :last_name, :string
    add_column :users, :agency_name, :string
    add_column :users, :agency_status, :boolean
  end
end
