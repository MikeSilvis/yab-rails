class AddPreferencesToMarket < ActiveRecord::Migration
  def change
    add_column :markets, :preferences, :hstore
    add_hstore_index :markets, :preferences
  end
end
