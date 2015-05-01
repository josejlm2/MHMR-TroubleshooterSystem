#create_user.feature
Feature: Create User
As an IT staff member
I want to add a User to the "Facility Troubleshooter" Database's user list
So that I may add more users

Scenario: Create new User
  Given I am an admin user
  When I go to the sign in page
  And I fill in "Email" with "name@test.com"
  And I fill in "Password" with "password1"
  And I press "Log in"
  And I go to the list of users
  And I follow "Create user"
  And I fill in "Email" with "name@temp.com"
  And I fill in "User Password" with "password1"
  And I fill in "Password Confirmation" with "password1"
  And I press "Create User"
  Then I should see "name@temp.com"
