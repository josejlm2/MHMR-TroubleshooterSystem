Feature: edit Location
As an IT staff member
I want to edit a Location in the "Facility Troubleshooter" Database location list
So that I may change location names

Scenario: edit Location
  Given I am an admin user
  When I go to the sign in page
  And I fill in "Email" with "name@test.com"
  And I fill in "Password" with "password1"
  And I press "Log in"
  And I have a location name Texas
  And I am on the locations  page
  And I follow "Edit Button"
  And I fill in "Name" with "Virginia"
  And I press "Save Changes"
  Then I should see "Virginia"

