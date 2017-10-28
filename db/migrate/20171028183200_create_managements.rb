class CreateManagements < ActiveRecord::Migration[5.1]
  def change
    create_table :managements do |t|
      t.string :name
      t.string :email
      t.string :identifier
      t.string :url
      t.text :description

      t.timestamps
    end
  end
end
