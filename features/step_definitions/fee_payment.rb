When(/^I visit "(.*?)"$/) do |path|
  visit path
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

Given(/^I search for a case with reference "([^"]*)" and confirmation code "([^"]*)"$/) do |tax_tribunal_reference, confirmation_code|
  step %[I fill in "Case reference" with "#{tax_tribunal_reference}"]
  step %[I fill in "Confirmation code" with "#{confirmation_code}"]
  step %[I click the "Find case" button]
end

