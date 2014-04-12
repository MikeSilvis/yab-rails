FactoryGirl.create :admin, email: 'mikesilvis@gmail.com', password: 'michael123'

merchant = FactoryGirl.create :merchant
market = FactoryGirl.create :market

FactoryGirl.create :location, merchant: merchant, market: market
FactoryGirl.create :location, merchant: merchant, market: market

