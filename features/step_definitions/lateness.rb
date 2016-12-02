And(/^I complete the lateness task$/) do
  many_steps(<<-LATE)
    Then I should see "Do you think you're in time to appeal to the tax tribunal?"
    When I choose "Yes, I am in time"
  LATE
end


