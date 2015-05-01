#edit_user.feature
Feature: edit User
As an IT staff member
I want to edit a User in the "Facility Troubleshooter" Database's user list
So that I may change a user's permissions

Scenario: edit User
  Given I am an admin user
  When I go to the sign in page
  And I fill in "Email" with "name@test.com"
  And I fill in "Password" with "password1"
  And I press "Log in"
  And I go to the list of users
  And I have a user
  And I follow "Edit"
  And I fill in "User Password" with "password2"
  And I fill in "Password Confirmation" with "password2"
  And I press "save changes"
  And I fill in "Email" with "name@test.com"
  And I fill in "Password" with "password2"
  And I press "Log in"
  And I go to the list of users
  Then I should see "name@test.com"

