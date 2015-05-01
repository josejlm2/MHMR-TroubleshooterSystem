#show_user.feature
Feature: Show Users
As an IT staff member
I want to see a list of Users
So that the I know what users are able to log in so they can view and submit tickets

Scenario: Show Users
  Given I am an admin user
  And I have a user
  When I go to the sign in page
  And I fill in "Email" with "name@test.com"
  And I fill in "Password" with "password1"
  And I press "Log in"
  And I go to the list of users
  Then I should see "name@temp.com"
  And I should see "name@test.com"

Scenario: Show User
  Given I am an admin user
  When I go to the sign in page
  And I fill in "Email" with "name@test.com"
  And I fill in "Password" with "password1"
  And I press "Log in"
  And I go to the list of users
  Then I should see "name@test.com"
