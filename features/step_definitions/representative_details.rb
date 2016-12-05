And(/^I enter individual representative details$/) do
  many_steps(<<-DETAILS)
    Then I should see "Is a representative acting for you?"
    And I should see "Step 3 of 16"
    When I choose "Yes"
    Then I should see "Is the representative an individual or company?"
    When I choose "Individual"
    And I fill in "Name" with "Atticus Finch"
    And I fill in "Address" with "5 Ravenscroft St, London E2 7SH"
    And I fill in "Email address" with "atticus@finch.co.uk"
    And I fill in "Phone number" with "0207 1234 482 282"
    And I click the "Continue" button
  DETAILS
end


