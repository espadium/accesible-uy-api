require 'rubygems'
require 'spork'
# uncomment the following line to use spork with the debugger
# require 'spork/ext/ruby-debug'

Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However,
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.

  # This file is copied to spec/ when you run 'rails generate rspec:install'
  ENV['RAILS_ENV'] ||= 'test'
  ENV['SKIP_RAILS_ADMIN_INITIALIZER'] = 'false'

  require File.expand_path('../../config/environment', __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'

  require 'factory_girl_rails'

  FactoryGirl.factories.clear
  FactoryGirl.reload

  # Checks for pending migrations before tests are run.
  # If you are not using ActiveRecord, you can remove this line.
  ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

  # Change rails logger level to reduce IO during tests
  Rails.logger.level = 4

  RSpec.configure do |config|
    config.use_transactional_fixtures = false
    config.infer_base_class_for_anonymous_controllers = false
    config.treat_symbols_as_metadata_keys_with_true_values = true
    config.order = 'random'

    config.include APIMatchers::RSpecMatchers

    config.include FactoryGirl::Syntax::Methods

    config.include RSpec::Rails::RequestExampleGroup,
    type: :request, example_group: {
      file_path: /test\/api/
    }
    # Uncomment if you want to include Devise. Add devise to your gemfile
    # config.include Devise::TestHelpers, type: :controller

    config.before :each do
      DatabaseCleaner.strategy = :transaction
      DatabaseCleaner.start
    end

    config.after do
      DatabaseCleaner.clean
    end
  end
end

Spork.each_run do
  # This code will be run each time you run your specs.

end
