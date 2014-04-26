class CreateUserRewards < ActiveRecord::Migration
  def change
    create_table :user_rewards do |t|
      t.references :user
      t.references :reward
      t.references :merchant
      t.timestamps
    end
  end
end
