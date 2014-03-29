class ConvertLatitudeToBigDecimal < ActiveRecord::Migration
  def change
    remove_column :locations, :latitude
    remove_column :locations, :longitude

    add_column :locations, :latitude, :decimal, precision: 15, scale: 10
    add_column :locations, :longitude, :decimal, precision: 15, scale: 10
  end
end
