class ChangeLatAndLongTypes < ActiveRecord::Migration
  def change
    remove_column :places, :latitude
    remove_column :places, :longitude

    add_column :places, :latitude, :float
    add_column :places, :longitude, :float
  end
end
