class AddPreferencesToMarket < ActiveRecord::Migration
  def change
    add_column :markets, :preferences, :hstore
  end
end
