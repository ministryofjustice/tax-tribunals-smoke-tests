Given(/^I target staging$/) do
  Capybara.app_host = ENV.fetch('DATACAPTURE_URI')
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

