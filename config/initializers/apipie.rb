Apipie.configure do |config|
  config.app_name                = "Yab"
  config.api_base_url            = "/api/v1"
  config.doc_base_url            = "/developer"
  config.default_version = "1"
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/api/v1/*.rb"
end
