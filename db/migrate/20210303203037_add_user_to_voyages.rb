class AddUserToVoyages < ActiveRecord::Migration[6.0]
  def change
    add_reference :voyages, :user, null: false, foreign_key: true
  end
end
