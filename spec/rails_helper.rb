require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  config.include JsonSpec::Helpers
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!

  config.infer_spec_type_from_file_location!
  config.before(:suite)              { DatabaseCleaner.clean_with(:truncation) }
  config.before(:each)               { DatabaseCleaner.strategy = :transaction }
  config.before(:each, js: true)     { DatabaseCleaner.strategy = :truncation }
  config.before(:each, sphinx: true) { DatabaseCleaner.strategy = :deletion }
  config.before(:each)               { DatabaseCleaner.start }
  config.after(:each)                { DatabaseCleaner.clean }
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec

    with.library :rails
  end
end
