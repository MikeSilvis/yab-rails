class RemoveBetaFromMarket < ActiveRecord::Migration
  def change
    remove_column :markets, :beta
  end
end
