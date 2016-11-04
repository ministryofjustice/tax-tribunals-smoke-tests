Feature: Fee Payment
  When a user visits "/", they should see the fee payments start page

  Scenario: User sees start page
    When I visit "/"
    Then I should see "Pay your tax tribunal fees"
    And I should see "Start now"

  Scenario: User clicks start button
    When I visit "/"
    And I click the "Start now" link
    Then I should see "Find your case"

  Scenario: User searches for nothing
    When I visit "/"
    And I click the "Start now" link
    And I click the "Find case" button
    Then I should see "We could not find your case"
    And I should see "Case reference can't be blank"
    And I should see "Confirmation code can't be blank"

  Scenario: User searches for non-existent case
    When I visit "/"
    And I click the "Start now" link
    And I fill in "Case reference" with "TC/2016/00001"
    And I fill in "Confirmation code" with "XXXYYY"
    And I click the "Find case" button
    Then I should see "We could not find your case"
