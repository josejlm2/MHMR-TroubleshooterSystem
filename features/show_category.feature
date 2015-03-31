#show_category.feature
Feature: Show Categories
As an IT staff member
I want to see a list of Categories
So that the I know what categories will show up in form of the  facility members so they can view and submit tickets

Scenario: Show Categories
Given I have categories name electricity, cars
When I go to the list of categories
Then I should see "electricity"
And I should see "cars"

Scenario: Show Category
Given I have a category name electricity
When I go to the show category
Then I should see "electricity"
