class AddFacebookInformation < ActiveRecord::Migration
  def change
    change_table :users, bulk: true do |t|
      t.column :birthday, :datetime
      t.column :gender, :string
      t.column :facebook_id, :string
      t.column :authentication_token, :string
    end
    add_index(:users, :authentication_token, unique: true)
  end
end
