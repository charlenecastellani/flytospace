class RemoveVoyagesFromReservations < ActiveRecord::Migration[6.0]
  def change
    remove_reference :reservations, :voyages, null: false, foreign_key: true
  end
end
