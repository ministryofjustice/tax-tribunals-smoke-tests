Feature: What is your dispute about?
  Background:
    Given I target the prototype
    When I authenticate to the prototype
    And I start the appeal process
    Then I should see "Did you challenge the original decision with HMRC?"
    And I should see "Step 1 of 7"
    When I choose "Yes"
    Then I should see "Step 2 of 7"
    And I say my appeal is about "Income Tax"
    Then I should see "Step 3 of 7"
    Then I should see "What is your dispute about?"

  Scenario Outline: Dispute choices
    When I choose "<dispute_about>"
    Then I should see "<next_step>"
    Examples:
      | dispute_about        | next_step                                     |
      | Penalty or surcharge | What is the penalty or surcharge amount?      |
      | Amount of tax owed   | To submit an appeal you will have to pay £200 |
      | None of the above    | To submit an appeal you will have to pay £200 |
