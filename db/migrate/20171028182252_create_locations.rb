class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :label
      t.string :layer
      t.decimal :latitude
      t.decimal :longitude
      t.string :address_1
      t.string :address_2
      t.string :county
      t.string :city
      t.string :state
      t.string :neighbourhood
      t.string :postal_code
      t.string :country
      t.jsonb :data

      t.timestamps
    end
  end
end
