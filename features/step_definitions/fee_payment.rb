Given(/^I target the fee payment application$/) do
  Capybara.app_host = ENV.fetch('FEE_PAYMENT_URL')
end

Then(/^I should see a payment button$/) do
  link = page.find('a.button')
  expect(link.text).to eq('Pay now')
  expect(link[:href]).to match(%r[^#{ENV.fetch('FEE_PAYMENT_URL')}/fees/[a-f0-9-]+/pay$])
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

