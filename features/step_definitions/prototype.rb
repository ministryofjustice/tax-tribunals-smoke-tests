
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

# I couldn't click the radio button using 'choose(text)', so just
# click the label with matching text - that should have the same
# effect
When(/^I choose "([^"]*)"$/) do |text|
  find('label', text: text).click
end
