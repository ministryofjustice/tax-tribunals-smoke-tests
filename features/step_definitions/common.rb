Given(/^I start$/) do
  Capybara.app_host = ENV.fetch('DATACAPTURE_URI')
end

When /^I dump the response$/ do
  puts body
end

When(/^I visit the home page$/) do
  visit '/'
end

When(/^I visit "(.*?)"$/) do |path|
  visit path
end

Then(/^I should be on the task list page$/) do
  expect("#{Capybara.app_host}#{URI.parse(current_url).path}").to eql("#{Capybara.app_host + ENV.fetch('TASK_LIST_PAGE')}")
end

Then(/^I should be on "([^"]*)"$/) do |page_name|
  expect("#{Capybara.app_host}#{URI.parse(current_url).path}").to eql("#{Capybara.app_host}#{page_name}")
end

Then(/^I should see "(.*?)"$/) do |text|
  expect(page).to have_text(text)
end

When(/^I click the "(.*?)" link$/) do |text|
  click_link(text)
end

When(/^I click the "(.*?)" button$/) do |text|
  click_button(text)
end

When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |field, value|
  fill_in(field, with: value)
end

# I couldn't click the radio button using 'choose(text)', so just
# click the label with matching text - that should have the same
# effect
When(/^I click the radio button "([^"]*)"$/) do |text|
  find('label', text: text).click
end

When(/^I choose "([^"]*)"$/) do |text|
  step %[I click the radio button "#{text}"]
  click_button("Continue")
end


