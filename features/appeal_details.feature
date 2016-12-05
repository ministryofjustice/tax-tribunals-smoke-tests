Feature: Appeal details
  Background:
    Given I target the prototype
    When I authenticate to the prototype
    And I complete the cost determination task
    And I complete the lateness task
    Then I should see "3. Enter appeal details and pay fee"
    When I click the "Start now" link
    Then I should see "Is the appeal for an individual or company?"

  Scenario: Individual
    When I choose "Individual"
    Then I should see "Taxpayer's details"
    When I fill in "Name" with "Andrew Sachs"
    And I fill in "Address" with "Fawlty Towers\n16 Elwood Avenue\nTorquay"
    And I fill in "Email address" with "manuel@fawlty-towers.co.uk"
    And I fill in "Phone number" with "01238 38272923"
    And I click the "Continue" button
    Then I should see "Is a representative acting for you?"

  Scenario: Company
    When I choose "Company"
    Then I should see "Taxpayer's details"
    When I fill in "Company name" with "Fawlty Towers"
    And I fill in "Address" with "16 Elwood Avenue\nTorquay"
    And I fill in "Company registered number" with "0123456789"
    And I fill in "Company contact person" with "Basil Fawlty"
    And I fill in "Company's contact email address" with "bookings@fawlty-towers.co.uk"
    And I fill in "Company's contact phone number" with "01238 38272923"
    And I click the "Continue" button
    Then I should see "Is a representative acting for you?"

