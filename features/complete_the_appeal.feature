Feature: Complete the appeal
  Background:
    Given I start
    And I complete the cost determination task
    And I complete the lateness task
    And I enter individual appellant details
    And I enter individual representative details
    Then I should see "Is the representative a legal professional?"
    And I should see "Step 6 of 16"
    When I choose "Yes"
    Then I should see "What outcome do you want from your appeal?"
    And I should see "Step 9 of 16"

  Scenario:
    When I fill in "desired_outcome" with "I don't want to pay any tax"
    And I click the "Continue" button
    Then I should see "Grounds for appeal"
    And I fill in "grounds_for_appeal" with "I am Richard Branson"
    And I should see "Step 10 of 16"
    When I click the "Continue" button
    Then I should see "Document checklist"
    And I should see "Step 11 of 16"
    When I click the "Continue" button
    Then I should see "Check answers"
    When I click the "Submit and continue" link
    Then I should see "Debit or credit card"
    And I should see "Help with fees"
    And I should see "Authorised account"
    And I should see "Cheque"



