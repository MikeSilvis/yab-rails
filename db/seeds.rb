market = FactoryGirl.create :market

FactoryGirl.create :admin, email: 'mikesilvis@gmail.com', password: 'michael123', facebook_id: 'mikesilvis', market: market

merchant = FactoryGirl.create :merchant

FactoryGirl.create :location, merchant: merchant, market: market
FactoryGirl.create :location, merchant: merchant, market: market

