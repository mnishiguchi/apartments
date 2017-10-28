class CreateAmenities < ActiveRecord::Migration[5.1]
  def change
    create_table :amenities do |t|
      t.string :identifier, null: false
      t.string :title, null: false
      t.string :tags, array: true, default: []

      t.timestamps
    end
  end
end
