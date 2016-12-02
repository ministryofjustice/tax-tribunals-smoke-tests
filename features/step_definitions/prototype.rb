Given(/^I target the prototype$/) do
  Capybara.app_host = ENV.fetch('PROTOTYPE_URL')
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

And(/^I start the appeal process$/) do
  many_steps(<<-START)
    Then I should see "The tax tribunal is independent of government"
    And I should see "Find out the cost of your appeal"
    And I should see "Check you meet the tribunal deadline"
    And I should see "Enter appeal details and pay fee"
    When I click the "Start" link
    Then I should see "You will need to pay an initial fee of £20, £50 or £200"
    When I click the "Continue" link
  START
end

# Move as quickly as possible through the cost determination
# task, so that we can write simple tests for later stages
# of the process
And(/^I complete the cost determination task$/) do
  many_steps(<<-COST)
    When I start the appeal process
    Then I should see "Did you challenge the original decision with HMRC?"
    When I choose "Yes"

    And I click the "Continue" button

    Then I should see "What is your appeal about?"
    When I choose "Income Tax"
    And I click the "Continue" button

    Then I should see "What is your dispute about?"
    When I choose "Penalty or surcharge"
    And I click the "Continue" button

    Then I should see "What is the penalty or surcharge amount?"
    When I choose "£100 or less"
    And I click the "Continue" button

    Then I should see "To submit an appeal you will have to pay £20"

    When I click the "Continue" link
    Then I should be on "/end_to_end/task-list"

    When I click the "Start" link
    Then I should see "2. Check you meet tribunal deadlines"

    When I click the "Continue" link
  COST
end

# I couldn't click the radio button using 'choose(text)', so just
# click the label with matching text - that should have the same
# effect
When(/^I choose "([^"]*)"$/) do |text|
  find('label', text: text).click
end
