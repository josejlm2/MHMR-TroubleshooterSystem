#edit_category.feature
Feature: edit Category
As an IT staff member
I want to edit a Category in the "Facility Troubleshooter" Database's category list
So that I may fix a typo

Scenario: edit Category
Given I have a category name cars
And I am on the edit category page
And I fill in "Name" with "Electricity"
And I press "save changes"
Then I should see "Electricity"

