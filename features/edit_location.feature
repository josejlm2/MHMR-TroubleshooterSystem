Feature: edit Location
As an IT staff member
I want to edit a Location in the "Facility Troubleshooter" Database location list
So that I may change location names

Scenario: edit Location
  Given I have a location name Texas
  And I am on the locations  page
  And I follow "Edit Location"
  And I fill in "Name" with "Virginia"
  And I press "save changes"
  Then I should see "Virginia"

