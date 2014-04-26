class AddCacheToUser < ActiveRecord::Migration
  def change
    change_table :users, bulk: true do |t|
      t.integer :current_level_id
      t.integer :next_level_id
      t.integer :checkins_count
    end
  end
end
