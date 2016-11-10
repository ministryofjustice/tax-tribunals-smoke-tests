require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'capybara/poltergeist'

Capybara.run_server = false
Capybara.default_driver = :poltergeist
Capybara.javascript_driver = :poltergeist

Capybara.app_host = ENV.fetch('FEE_PAYMENT_URL')
