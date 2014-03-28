class ConvertLatitudeToBigDecimal < ActiveRecord::Migration
  def change
    remove_column :locations, :latitude
    remove_column :locations, :longitude

    add_column :locations, :lat, :decimal, precision: 15, scale: 10
    add_column :locations, :lng, :decimal, precision: 15, scale: 10
  end
end
