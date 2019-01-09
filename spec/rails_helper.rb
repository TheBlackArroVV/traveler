require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'
require 'dox'
ActiveRecord::Migration.maintain_test_schema!

Dir[Rails.root.join('spec/api_doc/**/*.rb')].each { |f| require f }
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  config.include JsonSpec::Helpers
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!

  config.infer_spec_type_from_file_location!
  config.before(:suite) { DatabaseCleaner.clean_with(:truncation) }
  config.before               { DatabaseCleaner.strategy = :transaction }
  config.before               { DatabaseCleaner.start }
  config.after                { DatabaseCleaner.clean }

  config.after(:each, :dox) do |example|
    example.metadata[:request] = request
    example.metadata[:response] = response
  end
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec

    with.library :rails
  end
end
