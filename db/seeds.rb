market = FactoryGirl.create :market

FactoryGirl.create :admin, email: 'mikesilvis@gmail.com', password: 'michael123', facebook_id: 'mikesilvis', market: market

merchants = []
users = []

(0..20).to_a.each do
  merchant = FactoryGirl.create :merchant
  FactoryGirl.create :location, merchant: merchant, market: market
  FactoryGirl.create :level, avatar: 'https://cdn3.iconfinder.com/data/icons/iconic-1/32/bolt-128.png'
  user = FactoryGirl.create :user
  (0..3).to_a.each do
    merchant.rewards << FactoryGirl.build(:reward)
  end
  merchants << merchant
  users << user
end

(0..20).to_a.each do
  merchant = merchants.sample
  FactoryGirl.create :checkin, user: users.sample, merchant: merchant, location: merchant.locations.first
end
