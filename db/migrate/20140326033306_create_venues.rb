class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :latitude
      t.string :longitude
      t.string :street
      t.string :state
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
