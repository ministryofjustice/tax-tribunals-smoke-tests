Feature: What is your dispute about?
  Background:
    Given I start
    And I start the appeal process
    Then I should see "Did you challenge the original decision with HMRC?"
    And I should see "Step 1 of 7"
    When I choose "Yes"
    Then I should see "Step 2 of 7"
    And I say my appeal is about "Income Tax"
    Then I should see "Step 3 of 7"
    Then I should see "What is your dispute about?"
    When I choose "Penalty or surcharge"
    Then I should see "Step 4 of 7"
    Then I should see "What is the penalty or surcharge amount?"

  Scenario Outline: Dispute choices
    When I choose "<penalty_amount>"
    Then I should see "To submit an appeal you will have to pay <lodgement_fee>"
    When I click the "Continue" link
    Then I should be on the task list page
    And I should see "<lodgement_fee>"
    Examples:
      | penalty_amount  | lodgement_fee |
      | £100 or less    | £20           |
      | £101 – £20,000  | £50           |
      | £20,001 or more | £200          |
