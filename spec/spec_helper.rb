ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

ActiveRecord::Base.logger.level = Logger::INFO
ActionController::Base.logger.level = Logger::ERROR
Rails.logger.level = Logger::ERROR

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  config.before(:each) do
    Yab::Facebook.any_instance.stub(:me).and_return(
      "id" => "1476420296",
      "name" => "Mike Silvis",
      "first_name" => "Mike",
      "last_name" => "Silvis",
      "link" => "https://www.facebook.com/mike.silvis",
      "birthday" => "05/04/1990",
      "location" => {
        "id" => "114952118516947",
        "name" => "San Francisco, California"
      },
      "gender" => "male",
      "email" => "mikesilvis@gmail.com",
      "timezone" => -7,
      "locale" => "en_US",
      "verified" => true,
      "updated_time" => "2014-02-23T02:47:57+0000",
      "username" => "mike.silvis"
    )
  end

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.filter_run show_in_doc: true if ENV['APIPIE_RECORD']
end
