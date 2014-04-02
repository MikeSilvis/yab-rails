class AddAttributesToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :street, :string
    add_column :locations, :state, :string
    add_column :locations, :zipcode, :integer
    add_column :locations, :city, :string
    add_column :locations, :market_id, :integer
  end
end
