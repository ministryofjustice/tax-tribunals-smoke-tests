require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'capybara/poltergeist'
# require 'pry-byebug'

Capybara.run_server = false
Capybara.default_driver = :poltergeist
Capybara.javascript_driver = :poltergeist

# Capybara.app_host = ENV.fetch('FEE_PAYMENT_URL')
Capybara.app_host = ENV.fetch('PROTOTYPE_URL')

