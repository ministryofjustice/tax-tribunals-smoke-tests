Feature: Fee Payment
  Background:
    Given I target the fee payment application

  # These tests should all fail if GLiMR is not available

  Scenario: User sees start page
    When I visit "/"
    Then I should see "Pay your tax tribunal fees"
    And I should see "Start now"

  Scenario: User clicks start button
    When I visit "/"
    And I click the "Start now" link
    Then I should be on "/case_requests"
    And I should see "Find your case"

  Scenario: User searches for nothing
    When I visit "/"
    And I click the "Start now" link
    And I click the "Find case" button
    Then I should see "We could not find your case"
    And I should see "Case reference can't be blank"
    And I should see "Confirmation code can't be blank"

  Scenario: User searches for non-existent case
    When I visit "/case_requests"
    And I search for a case with reference "TC/2016/00001" and confirmation code "XXXYYY"
    Then I should see "We could not find your case"

  # The tests below depend on a corresponding case existing in GLiMR

  Scenario: User searches for case with a fee to pay
    When I visit "/case_requests"
    And I search for a case with a fee to pay
    Then I should see the title of the case with a fee to pay
    And I should see the payable amount of the case with a fee to pay
    And I should see a payment button

  # It would be good to check that we are redirected to gov.uk pay if we click 'pay now', but
  # I can't get Capybara to test an external redirect
