#create_category.feature
Feature: Create Category
As an IT staff member
I want to add a Category to the "Facility Troubleshooter" Database's category list
So that I may add more categories

Scenario: Create new Category
  Given I have no categories
  When I am on the list of categories
  Given I click on create category
  And I fill in "Name" with "Electricity"
  And I press "Save Changes"
  Then I should see "Electricity"
  And I should have 1 category
