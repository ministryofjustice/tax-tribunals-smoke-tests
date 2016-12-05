Feature: What is your appeal about?
  Background:
    Given I start
    And I start the appeal process
    Then I should see "Did you challenge the original decision with HMRC?"
    And I should see "Step 1 of 7"

  Scenario Outline: Not challenged HMRC
    When I choose "No"
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

  # NB: 'Gaming Duty' is missing from this scenario, because it's a substring of
  # Remote Gaming Duty. But, the next step is the same
  Scenario Outline: Not challenged HMRC - Other
    When I choose "No"
    Then I should see "Step 2 of 7"
    And I say my appeal is about "Other"
    Then I should see "What is your appeal about?"
    And I say my appeal is about "<appeal_about>"
    Then I should see "<next_step>"
    Examples:
      | appeal_about                         | next_step                                                |
      | Construction Industry Scheme         | You must challenge HMRC                                  |
      | Inheritance Tax                      | You must challenge HMRC                                  |
      | National Insurance                   | You must challenge HMRC                                  |
      | Petroleum Revenue Tax                | You must challenge HMRC                                  |
      | Stamp duties                         | You must challenge HMRC                                  |
      | Statutory payments                   | You must challenge HMRC                                  |
      | Student loans                        | You must challenge HMRC                                  |
      | Accelerated Payment Notice           | What is your dispute about?                              |
      | Aggregates Levy                      | What is your dispute about?                              |
      | Air Passenger Duty                   | What is your dispute about?                              |
      | Alcoholic Liquor Duties              | What is your dispute about?                              |
      | Bingo Duty                           | What is your dispute about?                              |
      | Climate Change Levy                  | What is your dispute about?                              |
      | Customs Duty                         | What is your dispute about?                              |
      | Disclosure Of Tax Avoidance Schemes  | What is your dispute about?                              |
      | Export (Penalty) Regulations         | What is your dispute about?                              |
      | General Betting Duty                 | What is your dispute about?                              |
      | Insurance Premium Tax                | What is your dispute about?                              |
      | Landfill Tax                         | What is your dispute about?                              |
      | Lottery Duty                         | What is your dispute about?                              |
      | Pool Betting Duty                    | What is your dispute about?                              |
      | Remote Gaming Duty                   | What is your dispute about?                              |
      | Tobacco Products Duty                | What is your dispute about?                              |
      | Counter-terrorism decision           | To submit an appeal you will have to pay £200            |
      | Hydrocarbon Oil Duties               | To submit an appeal you will have to pay £200            |
      | My dispute is not listed             | To submit an appeal you will have to pay £200            |
      | Request permission for a late review | To submit an appeal you will have to pay £50             |
      | Restoration case                     | To submit an appeal you will have to pay £200            |
      | Money laundering decisions           | Have you paid the amount of tax involved in the dispute? |

  Scenario Outline: Challenged HMRC
    When I choose "Yes"
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

  # NB: 'Gaming Duty' is missing from this scenario, because it's a substring of
  # Remote Gaming Duty. But, the next step is the same
  Scenario Outline: Challenged HMRC - Other
    When I choose "Yes"
    Then I should see "Step 2 of 7"
    And I say my appeal is about "Other"
    Then I should see "What is your appeal about?"
    And I say my appeal is about "<appeal_about>"
    Then I should see "<next_step>"
    Examples:
      | appeal_about                         | next_step                                                |
      | Accelerated Payment Notice           | What is your dispute about?                              |
      | Aggregates Levy                      | What is your dispute about?                              |
      | Air Passenger Duty                   | What is your dispute about?                              |
      | Alcoholic Liquor Duties              | What is your dispute about?                              |
      | Bingo Duty                           | What is your dispute about?                              |
      | Climate Change Levy                  | What is your dispute about?                              |
      | Construction Industry Scheme         | What is your dispute about?                              |
      | Customs Duty                         | What is your dispute about?                              |
      | Disclosure Of Tax Avoidance Schemes  | What is your dispute about?                              |
      | Export (Penalty) Regulations         | What is your dispute about?                              |
      | General Betting Duty                 | What is your dispute about?                              |
      | Inheritance Tax                      | What is your dispute about?                              |
      | Insurance Premium Tax                | What is your dispute about?                              |
      | Landfill Tax                         | What is your dispute about?                              |
      | Lottery Duty                         | What is your dispute about?                              |
      | National Insurance                   | What is your dispute about?                              |
      | Petroleum Revenue Tax                | What is your dispute about?                              |
      | Pool Betting Duty                    | What is your dispute about?                              |
      | Remote Gaming Duty                   | What is your dispute about?                              |
      | Stamp duties                         | What is your dispute about?                              |
      | Statutory payments                   | What is your dispute about?                              |
      | Student loans                        | What is your dispute about?                              |
      | Tobacco Products Duty                | What is your dispute about?                              |
      | Counter-terrorism decision           | To submit an appeal you will have to pay £200            |
      | Hydrocarbon Oil Duties               | To submit an appeal you will have to pay £200            |
      | My dispute is not listed             | To submit an appeal you will have to pay £200            |
      | Request permission for a late review | To submit an appeal you will have to pay £50             |
      | Restoration case                     | To submit an appeal you will have to pay £200            |
      | Money laundering decisions           | Have you paid the amount of tax involved in the dispute? |

