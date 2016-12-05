Feature: Representative
  Background:
    Given I target the prototype
    When I authenticate to the prototype
    And I complete the cost determination task
    And I complete the lateness task
    When I enter individual appellant details
    Then I should see "Is a representative acting for you?"
    And I should see "Step 3 of 16"

  Scenario: No representative
    When I choose "No"
    Then I should see "What outcome do you want from your appeal?"

  Scenario: Individual representative
    When I choose "Yes"
    Then I should see "Step 4 of 16"
    And I should see "Is the representative an individual or company?"
    When I choose "Individual"
    Then I should see "Representative's details"
    And I should see "Step 5 of 16"
    When I fill in "Name" with "Atticus Finch"
    And I fill in "Address" with "5 Ravenscroft St, London E2 7SH"
    And I fill in "Email address" with "atticus@finch.co.uk"
    And I fill in "Phone number" with "0207 1234 482 282"
    And I click the "Continue" button
    Then I should see "Is the representative a legal professional?"

  Scenario: Company representative
    When I choose "Yes"
    Then I should see "Step 4 of 16"
    And I should see "Is the representative an individual or company?"
    When I choose "Company"
    Then I should see "Representative's details"
    And I should see "Step 5 of 16"
    When I fill in "Company name" with "Atticus Finch"
    And I fill in "Address" with "5 Ravenscroft St, London E2 7SH"
    And I fill in "Company registered number" with "01234832"
    And I fill in "Contact (first name and last name)" with "Some Guy"
    And I fill in "Contact's email address" with "atticus@finch.co.uk"
    And I fill in "Contact's phone number" with "0207 1234 482 282"
    And I click the "Continue" button
    Then I should see "Is the representative a legal professional?"
