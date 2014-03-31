class CreateMarkets < ActiveRecord::Migration
  def change
    create_table :markets do |t|
      t.string :name

      t.timestamps
    end
    Market.create!(name: 'Penn State University')
    add_column :users, :market_id, :integer
  end
end
