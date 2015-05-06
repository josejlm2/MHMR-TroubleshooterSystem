Feature: destroy Location
As an IT staff member
So that I can change the locations in the database
I want to delete a location to the "Facility Troubleshooter" Database's location list

Scenario: delete Location
  Given I am an admin user
  When I go to the sign in page
  And I fill in "Email" with "name@test.com"
  And I fill in "Password" with "password1"
  And I press "Log in"
  And I have no locations
  And I have a location name texas
  And I am on the locations page
  And I follow "Delete"
  Then I should have 0 location
