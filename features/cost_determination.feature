Feature: Determining the cost of an appeal
  Background:
    Given I target the prototype
    When I authenticate to the prototype
    And I start the appeal process
    Then I should see "Did you challenge the original decision with HMRC?"
    And I should see "Step 1 of 7"

  Scenario: Challenged Yes, Income Tax
    When I choose "Yes"
    And I say my appeal is about "Income Tax"

    Then I should see "What is your dispute about?"
    When I choose "Penalty or surcharge"

    Then I should see "What is the penalty or surcharge amount?"
    When I choose "£100 or less"

    Then I should see "To submit an appeal you will have to pay £20"

    When I click the "Continue" link
    Then I should be on the task list page

    When I click the "Start" link
    Then I should see "2. Check you meet tribunal deadlines"

    When I click the "Continue" link

    Then I should see "Do you think you're in time to appeal to the tax tribunal?"

    When I choose "Yes, I am in time"

    Then I should be on the task list page
    And I should see "IN TIME"

    When I click the "Start" link
    Then I should see "3. Enter appeal details and pay fee"

    When I click the "Start now" link
    Then I should see "Is the appeal for an individual or company?"

    When I choose "Individual"
    Then I should see "Taxpayer's details"
