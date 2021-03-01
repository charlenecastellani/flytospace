class CreateVoyages < ActiveRecord::Migration[6.0]
  def change
    create_table :voyages do |t|
      t.string :destination
      t.integer :year
      t.integer :price
      t.text :description

      t.timestamps
    end
  end
end
