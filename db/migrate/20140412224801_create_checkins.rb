class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
      t.integer :location_id
      t.integer :merchant_id
      t.integer :user_id

      t.timestamps
    end
    change_table :locations, bulk: true do|t|
      t.string :uuid
      t.string :identifier
      t.string :major
      t.string :minor
      t.remove :ping_count
    end
  end
end
