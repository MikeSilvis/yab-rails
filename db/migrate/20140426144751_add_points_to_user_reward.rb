class AddPointsToUserReward < ActiveRecord::Migration
  def change
    add_column :user_rewards, :checkins_count, :integer, default: 0
    change_column :users, :checkins_count, :integer, default: 0
  end
end
