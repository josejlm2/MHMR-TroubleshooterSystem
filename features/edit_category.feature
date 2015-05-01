#edit_category.feature
Feature: edit Category
As an IT staff member
I want to edit a Category in the "Facility Troubleshooter" Database's category list
So that I may fix a typo

Scenario: edit Category
  Given I am an admin user
  When I go to the sign in page
  And I fill in "Email" with "name@test.com"
  And I fill in "Password" with "password1"
  And I press "Log in"
  And I have a category name cars
  And I am on the edit category page
  And I fill in "Name" with "Electricity"
  And I press "Save Changes"
  Then I should see "Electricity"
