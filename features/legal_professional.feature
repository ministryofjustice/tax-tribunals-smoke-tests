Feature: Authorising a representative
  Background:
    Given I target the prototype
    When I authenticate to the prototype
    And I complete the cost determination task
    And I complete the lateness task
    When I enter individual appellant details
    And I enter individual representative details
    Then I should see "Is the representative a legal professional?"
    And I should see "Step 6 of 16"

  Scenario: Legal professional, taxpayer
    When I choose "No"
    Then I should see "Approve a non-legal representative"
    And I should see "Step 7 of 16"
    When I choose "I am the taxpayer"
    Then I should see "What outcome do you want from your appeal?"
    And I should see "Step 9 of 16"

  Scenario: Legal professional, representative
    When I choose "No"
    Then I should see "Approve a non-legal representative"
    And I should see "Step 7 of 16"
    When I click the radio button "I am the representative"
    Then I should see "You will need approval to act on behalf of the taxpayer"
    And I should see "Download this in PDF format"

  Scenario: Legal professional
    When I choose "Yes"
    Then I should see "What outcome do you want from your appeal?"
    And I should see "Step 9 of 16"

