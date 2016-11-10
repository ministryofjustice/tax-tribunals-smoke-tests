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

When(/^I search for a case with a fee to pay/) do
  step %[I fill in "Case reference" with "#{ENV.fetch('CASE_WITH_FEE_REF')}"]
  step %[I fill in "Confirmation code" with "#{ENV.fetch('CASE_WITH_FEE_CONF_CODE')}"]
  step %[I click the "Find case" button]
end

Then(/^I should see the title of the case with a fee to pay$/) do
  expect(page).to have_text(ENV.fetch('CASE_WITH_FEE_TITLE'))
end

Then(/^I should see the payable amount of the case with a fee to pay$/) do
  expect(page).to have_text(ENV.fetch('CASE_WITH_FEE_AMOUNT'))
end

When(/^I search for a case with reference "([^"]*)" and confirmation code "([^"]*)"$/) do |tax_tribunal_reference, confirmation_code|
  step %[I fill in "Case reference" with "#{tax_tribunal_reference}"]
  step %[I fill in "Confirmation code" with "#{confirmation_code}"]
  step %[I click the "Find case" button]
end

