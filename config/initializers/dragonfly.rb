require 'dragonfly'
require 'dragonfly/s3_data_store'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  protect_from_dos_attacks true
  secret ENV['DRAGON_SECRET'] || "893d9ee6f26bc9bd3e2e761d0502b186115a800218262cf7a85bff7720b5dfca"

  url_host ENV['DEFAULT_HOST'] || 'http://localhost:3000'

  url_format "/media/:job/:name"

  datastore :s3,
    bucket_name: ENV['BUCKET'] || 'yabdev',
    access_key_id: ENV['ACCESS_KEY'],
    secret_access_key: ENV['SECRET_KEY']
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
