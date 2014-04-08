class AddSlugToMarket < ActiveRecord::Migration
  def change
    add_column :markets, :slug, :string
  end
end
