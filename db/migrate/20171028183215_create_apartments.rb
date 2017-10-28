class CreateApartments < ActiveRecord::Migration[5.1]
  def change
    create_table :apartments do |t|
      t.string :name
      t.string :email
      t.text :description
      t.string :url
      t.string :phone
      t.jsonb :office_hours, default: {}
      t.references :management, foreign_key: true

      t.timestamps
    end
  end
end
