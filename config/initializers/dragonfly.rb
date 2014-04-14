require 'dragonfly'
require 'dragonfly/s3_data_store'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  protect_from_dos_attacks true
  secret "892d9ee6f26bc9bd3e2e761d0502b186115a800218262cf7a85bff7720b5dfca"

  url_format "/media/:job/:name"

  datastore :s3,
    bucket_name: ENV['BUCKET'] || 'yab_dev',
    access_key_id: 'AKIAJHCAHJH63OI33KLQ',
    secret_access_key: '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'
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
