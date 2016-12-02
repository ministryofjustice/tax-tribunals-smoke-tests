Feature: Determining the cost of an appeal
  Background:
    Given I target the prototype
    When I authenticate to the prototype
    And I start the appeal process
    Then I should see "Did you challenge the original decision with HMRC?"

  Scenario Outline: Not challenged HMRC appeal about step
    When I choose "No"
    And I click the "Continue" button
    And I say my appeal is about "<appeal_about>"
    Then I should see "<next_step>"
    Examples:
      | appeal_about              | next_step                                    |
      | Income Tax                | You must challenge HMRC                      |
      | Capital Gains Tax         | You must challenge HMRC                      |
      | Corporation Tax           | You must challenge HMRC                      |
      | Inaccurate return penalty | To submit an appeal you will have to pay £50 |
      | Apply to close an enquiry | To submit an appeal you will have to pay £50 |
      | Information notices       | To submit an appeal you will have to pay £50 |
      | Value Added Tax           | What is your dispute about?                  |
      | Other                     | What is your appeal about?                   |

  Scenario Outline: Challenged HMRC appeal about step
    When I choose "Yes"
    And I click the "Continue" button
    And I say my appeal is about "<appeal_about>"
    Then I should see "<next_step>"
    Examples:
      | appeal_about              | next_step                                    |
      | Income Tax                | What is your dispute about?                  |
      | Capital Gains Tax         | What is your dispute about?                  |
      | Corporation Tax           | What is your dispute about?                  |
      | Inaccurate return penalty | To submit an appeal you will have to pay £50 |
      | Apply to close an enquiry | To submit an appeal you will have to pay £50 |
      | Information notices       | To submit an appeal you will have to pay £50 |
      | Value Added Tax           | What is your dispute about?                  |
      | Other                     | What is your appeal about?                   |

  Scenario: Challenged Yes, Income Tax
    When I choose "Yes"
    And I click the "Continue" button
    And I say my appeal is about "Income Tax"

    Then I should see "What is your dispute about?"
    When I choose "Penalty or surcharge"
    And I click the "Continue" button

    Then I should see "What is the penalty or surcharge amount?"
    When I choose "£100 or less"
    And I click the "Continue" button

    Then I should see "To submit an appeal you will have to pay £20"

    When I click the "Continue" link
    Then I should be on the task list page

    When I click the "Start" link
    Then I should see "2. Check you meet tribunal deadlines"

    When I click the "Continue" link

    Then I should see "Do you think you're in time to appeal to the tax tribunal?"

    When I choose "Yes, I am in time"
    And I click the "Continue" button

    Then I should be on the task list page
    And I should see "IN TIME"

    When I click the "Start" link
    Then I should see "3. Enter appeal details and pay fee"

    When I click the "Start now" link
    Then I should see "Is the appeal for an individual or company?"

    When I choose "Individual"
    And I click the "Continue" button
    Then I should see "Taxpayer's details"
