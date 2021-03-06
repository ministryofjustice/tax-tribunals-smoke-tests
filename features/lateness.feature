Feature: Determining lateness of an appeal
  Background:
    Given I start
    And I complete the cost determination task
    Then I should see "Do you think you're in time to appeal to the tax tribunal?"

  Scenario: In time
    When I choose "Yes, I am in time"

    Then I should be on the task list page
    And I should see "IN TIME"

  Scenario: Late
    When I choose "No, I am late"

    Then I should see "Why are you late with your appeal?"

    When I click the "Continue" button

    Then I should be on the task list page
    And I should see "LATE"

  Scenario: Not sure
    When I choose "I'm not sure"

    Then I should see "Why are you late with your appeal?"

    When I click the "Continue" button

    Then I should be on the task list page
    And I should see "NOT SURE"


