Feature: List Location
As an IT staff member
So that the facility members can view and submit tickets to it
I want to add a location to the "Facility Troubleshooter" Database's location list

Scenario: List Location
  Given I have a location name Texas
  And I am on the locations page
  Then I should see "Texas"

