class CreateFloorplans < ActiveRecord::Migration[5.1]
  def change
    create_table :floorplans do |t|
      t.string :name
      t.string :identifier
      t.string :image_url
      t.string :description
      t.string :availabitity_url
      t.decimal :bathroom_count
      t.decimal :bedroom_count
      t.integer :rent_min
      t.integer :rent_max
      t.integer :sqft_min
      t.integer :sqft_max
      t.integer :unit_count_total
      t.integer :unit_count_available
      t.references :apartment, foreign_key: true

      t.timestamps
    end
  end
end
