class CreateManagementLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :management_locations do |t|
      t.text :description
      t.references :management, foreign_key: true
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
