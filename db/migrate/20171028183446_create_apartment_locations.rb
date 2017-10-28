class CreateApartmentLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :apartment_locations do |t|
      t.text :description
      t.references :apartment, foreign_key: true
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
