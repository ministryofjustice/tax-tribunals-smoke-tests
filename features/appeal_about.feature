Feature: What is your appeal about?
  Background:
    Given I start
    When I start the appeal process
    Then I should see "What is your appeal about?"

  @happy_path
  Scenario: Individual Income Tax Happy Path
    Given I choose "Income Tax"
    Then I should see "Did you appeal the original decision with HMRC?"
    And I choose "Yes"
    Given I choose "I have a review conclusion letter"
    Then I should see "What is your dispute about?"
    Given I choose "Penalty or surcharge"
    Then I should see "How much is the penalty or surcharge you are disputing?"
    Given I choose "£100 or less"
    Then I should see "Do you think you're in time to appeal to the tax tribunal?"
    Given I choose "Yes, I am in time"
    Then I should see "Are you the taxpayer making the appeal?"
    Given I choose "Yes"
    Then I should see "Who is making the appeal?"
    Given I choose "Individual"
    Then I should see "Enter taxpayer's details"
    When I fill in "First name" with "Andrew"
    And I fill in "Last name" with "Sachs"
    And I fill in "Address" with "Fawlty Towers\n16 Elwood Avenue\nTorquay"
    And I fill in "Postcode" with "W1A 1AA"
    And I fill in "Email address" with "manuel@fawlty-towers.co.uk"
    And I click the "Continue" button
    Then I should see "Do you have someone to represent you?"
    Given I choose "No"
    Then I should see "Grounds for appeal"
    And I attach a file explaining my grounds
    And I click the "Continue" button
    And I click the "Back" link
    Then I should see "smoketest.docx"
    And I click the "Remove" button
    And I attach a file explaining my grounds
    And I click the "Continue" button
    Then I should see "What outcome do you want from your appeal?"
    And I fill in "Outcome" with "Drive my enemies before me, hear the laments of their women"
    And I click the "Continue" button
    Then I should see "Upload your letter(s)"
    And I check "Original notice letter"
    And I check "Review conclusion letter"


  #Scenario Outline: Not challenged HMRC
    #Given I choose "<appeal_about>"
    #And I choose "No"
    #Then I should see "<next_step>"
    #Examples:
      #| appeal_about              | next_step                                    |
      #| Capital Gains Tax         | You must appeal the original decision with HMRC |
      #| Corporation Tax           | You must appeal the original decision with HMRC |
      #| Income Tax                | You must appeal the original decision with HMRC |
      #| Information notice        | What is your dispute about?                  |
      #| Value Added Tax (VAT)     | What is your dispute about?                  |
      #| Other type of tax, appeal or application | What is your appeal about?                   |
      #| Inaccurate return penalty | How much is the penalty or surcharge you are disputing? |

