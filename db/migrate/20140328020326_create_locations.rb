class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.belongs_to :locationable, polymorphic: true
      t.string :longitude
      t.string :latitude

      t.timestamps
    end
  end
end
