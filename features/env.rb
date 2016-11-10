require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'capybara/poltergeist'

Capybara.run_server = false
Capybara.default_driver = :poltergeist
Capybara.javascript_driver = :poltergeist

FEE_PAYMENT_URL = 'https://taxtribs-fees-dev.dsd.io'

Capybara.app_host = FEE_PAYMENT_URL
