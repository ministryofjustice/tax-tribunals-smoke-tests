When(/^I visit "(.*?)"$/) do |path|
  visit path
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

