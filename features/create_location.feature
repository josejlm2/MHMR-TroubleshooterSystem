Feature: Create Location
As an IT staff member
So that the facility members can view and submit tickets to it
I want to add a location to the "Facility Troubleshooter" Database's location list

Scenario: Create new Location
  Given I am an admin user
  When I go to the sign in page
  And I fill in "Email" with "name@test.com"
  And I fill in "Password" with "password1"
  And I press "Log in"
  And I am on the locations page
  And I follow "Add Button"
  And I fill in "Name" with "Texas"
  And I press "Create Location" 
  Then I should see "Texas"
