Feature: Fee Payment
  When a user visits "/", they should see the fee payments start page

  Scenario: User sees start page
    When I visit "/"
    Then I should see "Pay your tax tribunal fees"
    And I should see "Start now"
