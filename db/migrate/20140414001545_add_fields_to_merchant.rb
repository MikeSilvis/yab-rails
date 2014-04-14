class AddFieldsToMerchant < ActiveRecord::Migration
  def change
    change_table :merchants, bulk: true do |t|
      t.string :facebook
      t.string :twitter
      t.string :aasm_state, default: :demand_generation
      t.string :avatar_uid
      t.integer :user_id
    end
  end
end
