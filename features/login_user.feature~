#login_user.feature
Feature: Login User
As a current user
I want to login as a user on the "Facility Troubleshooter" database
So that I may access the other pages

Scenario: Login User
  Given I am a current user 
  When I go to the sign in page
  And I fill in "Email" with "name@name.com"
  And I fill in "Password" with "password1"
  And I press "Log in"
  Then I should see "Signed in successfully."
