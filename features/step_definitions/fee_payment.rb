When(/^I visit "(.*?)"$/) do |path|
  visit path
end

Then(/^I should see "(.*?)"$/) do |text|
  expect(page).to have_text(text)
end
