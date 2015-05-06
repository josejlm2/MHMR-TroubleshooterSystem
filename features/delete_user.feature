#delete_user.feature
Feature: edit User
As an IT staff member
I want to delete a User in the "Facility Troubleshooter" Database's user list
So that I may not use it

Scenario: delete User
  Given I am an admin user
  When I go to the sign in page
  And I fill in "Email" with "name@test.com"
  And I fill in "Password" with "password1"
  And I press "Log in"
  And I have no users
  And I go to the list of users
  And I have a user
  When I follow "Delete"
  Then I should not see "name@temp.com" 
