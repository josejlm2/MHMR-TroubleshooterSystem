#delete_category.feature
Feature: edit Category
As an IT staff member
I want to delete a Category in the "Facility Troubleshooter" Database's category list
So that I may not use it

Scenario: delete Category
  Given I am an admin user
  When I go to the sign in page
  And I fill in "Email" with "name@test.com"
  And I fill in "Password" with "password1"
  And I press "Log in"
  And I have a category name cars
  And I am on the list of categories
  When I follow "Delete"
  Then I should have 0 category
