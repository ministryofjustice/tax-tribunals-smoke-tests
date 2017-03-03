And(/^I start the appeal process$/) do
  many_steps(<<-START)
    When I visit the home page
    Then I should see "What do you want to do?"
    When I click the "Appeal against a tax decision" link
    Then I should see "Appeal against a tax decision"
    And I click the "Continue" link
  START
end

And(/^I say my appeal is about "([^"]*)"$/) do |appeal_about|
  many_steps(<<-APPEAL_ABOUT)
    Then I should see "What is your appeal about?"
    When I choose "#{appeal_about}"
  APPEAL_ABOUT
end


