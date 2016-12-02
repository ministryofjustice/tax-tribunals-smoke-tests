And(/^I enter individual appellant details$/) do
  many_steps(<<-DETAILS)
    Then I should see "3. Enter appeal details and pay fee"
    When I click the "Start now" link
    Then I should see "Is the appeal for an individual or company?"
    When I choose "Individual"
    Then I should see "Taxpayer's details"
    When I fill in "Name" with "Andrew Sachs"
    And I fill in "Address" with "Fawlty Towers, 16 Elwood Avenue, Torquay"
    And I fill in "Email address" with "manuel@fawlty-towers.co.uk"
    And I fill in "Phone number" with "01238 38272923"
    And I click the "Continue" button
  DETAILS
end


