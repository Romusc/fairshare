
 # code pasted from the Testing karr lesson - unsure if I should paste it here or in test_helper.rb
  ENV['RAILS_ENV'] ||= 'test'
  require File.expand_path('../../config/environment', __FILE__)
  require 'rails/test_help'
  require 'minitest/reporters'
  Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new]

  class ActiveSupport::TestCase
    fixtures :all
  end

  require 'capybara/rails'
  class ActionDispatch::IntegrationTest
    include Capybara::DSL
    def teardown
      Capybara.reset_sessions!
      Capybara.use_default_driver
      Warden.test_reset!
    end
  end

  require 'capybara/poltergeist'
  Capybara.default_driver = :poltergeist

  # FOR DEVISER TO WORK WITH TESTS
  include Warden::Test::Helpers
  Warden.test_mode!

  # SHOULD SOLVE THE CAPYBARA POLTERGEIST STATUS FAIL ERROR (Try!)
  Capybara.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new(app, timeout: 1.minute, phantomjs_options: ['--load-images=no'])
  end
