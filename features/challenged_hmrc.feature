Feature: Determining the cost of an appeal
  Background:
    Given I target the prototype
    When I authenticate to the prototype
    And I start the appeal process
    Then I should see "Did you challenge the original decision with HMRC?"
    And I should see "Step 1 of 7"

  Scenario Outline: Not challenged HMRC
    When I choose "No"
    And I click the "Continue" button
    Then I should see "Step 2 of 7"
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

  Scenario Outline: Challenged HMRC
    When I choose "Yes"
    And I click the "Continue" button
    Then I should see "Step 2 of 7"
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

