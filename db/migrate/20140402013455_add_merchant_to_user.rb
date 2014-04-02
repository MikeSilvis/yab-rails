class AddMerchantToUser < ActiveRecord::Migration
  def change
    add_column :users, :merchant_id, :integer
  end
end
