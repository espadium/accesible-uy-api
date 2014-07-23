class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :address
      t.string :latitude
      t.string :longitude
      t.references :author, index: true
      t.references :client, index: true

      t.timestamps
    end
  end
end
