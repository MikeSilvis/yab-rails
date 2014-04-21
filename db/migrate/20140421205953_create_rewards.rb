class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.integer :points
      t.string :name
      t.references :merchant

      t.timestamps
    end
  end
end
