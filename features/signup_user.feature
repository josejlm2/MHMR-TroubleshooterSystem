#signup_user.feature
Feature: Sign Up User
As a new user
I want to sign up as a user on the "Facility Troubleshooter" database
So that I may access the other pages

Scenario: Sign Up User
  Given I am not a current user
  When I go to the sign in page
  And I follow "Sign up"
  And I fill in "Email" with "name@something.com"
  And I fill in "Password" with "password1"
  And I fill in "Password confirmation" with "password1"
  And I press "Sign up"
  Then I should see "Welcome! You have signed up successfully."
