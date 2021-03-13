class AddVoyageToReservations < ActiveRecord::Migration[6.0]
  def change
    add_reference :reservations, :voyage, null: false, foreign_key: true
  end
end
