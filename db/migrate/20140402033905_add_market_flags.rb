class AddMarketFlags < ActiveRecord::Migration
  def change
    add_column :markets, :beta, :boolean, default: true
  end
end
