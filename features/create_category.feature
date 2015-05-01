#create_category.feature
Feature: Create Category
As an IT staff member
I want to add a Category to the "Facility Troubleshooter" Database's category list
So that I may add more categories

Scenario: Create new Category
  Given I am an admin user
  When I go to the sign in page
  And I fill in "Email" with "name@test.com"
  And I fill in "Password" with "password1"
  And I press "Log in"
  And I have no categories
  And I am on the list of categories
  And I follow "Create category"
  And I fill in "Name" with "Electricity"
  And I press "Save Changes"
  Then I should see "Electricity"
  And I should have 1 category
