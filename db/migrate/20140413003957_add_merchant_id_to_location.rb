class AddMerchantIdToLocation < ActiveRecord::Migration
  def change
    Location.where(locationable_type: 'User').destroy_all

    add_column :locations, :merchant_id, :integer
    remove_column :locations, :locationable_id
    remove_column :locations, :locationable_type
  end
end
