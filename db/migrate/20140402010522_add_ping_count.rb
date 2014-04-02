class AddPingCount < ActiveRecord::Migration
  def change
    add_column :locations, :ping_count, :integer
  end
end
