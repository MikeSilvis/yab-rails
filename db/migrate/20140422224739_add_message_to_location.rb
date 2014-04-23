class AddMessageToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :message, :string
  end
end
