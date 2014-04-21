class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      t.integer :points
      t.string :name
      t.string :avatar_uid

      t.timestamps
    end
  end

  def up
    drop_table :active_admin_comments
  end
end
