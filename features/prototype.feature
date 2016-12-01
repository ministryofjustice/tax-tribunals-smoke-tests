Feature: Start page
  When a user visits "/end_to_end/task-list", they should see the task list

  Background:
    Given I authenticate to the prototype
    When I visit "/end_to_end/task-list"
    Then I should see "The tax tribunal is independent of government"
    And I should see "Find out the cost of your appeal"
    And I should see "Check you meet the tribunal deadline"
    And I should see "Enter appeal details and pay fee"
    When I click the "Start" link
    Then I should see "You will need to pay an initial fee of £20, £50 or £200"
    When I click the "Continue" link

  Scenario: Challenge No, Income Tax
    Then I should see "Did you challenge the original decision with HMRC?"
    When I choose "No"

    And I click the "Continue" button

    Then I should see "What is your appeal about?"
    When I choose "Income Tax"
    And I click the "Continue" button

    Then I should see "You must challenge HMRC"


  Scenario: Challenge Yes, Income Tax
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
