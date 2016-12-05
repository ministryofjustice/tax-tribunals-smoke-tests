Given(/^I target the prototype$/) do
  Capybara.app_host = ENV.fetch('PROTOTYPE_URL')
  ENV['TASK_LIST_PAGE'] = "/end_to_end/task-list"
end

Given(/^I target the prototype on localhost$/) do
  Capybara.app_host = 'http://localhost:3001'
  ENV['TASK_LIST_PAGE'] = "/end_to_end/task-list"
end

Given(/^I authenticate to the prototype$/) do
  username = 'tax-tribs'
  password = 'd4sh1ngR4cc00n'
  if page.driver.respond_to?(:basic_auth)
    page.driver.basic_auth(username, password)
  elsif page.driver.respond_to?(:basic_authorize)
    page.driver.basic_authorize(username, password)
  elsif page.driver.respond_to?(:browser) && page.driver.browser.respond_to?(:basic_authorize)
    page.driver.browser.basic_authorize(username, password)
  else
    raise "I don't know how to log in!"
  end
end
