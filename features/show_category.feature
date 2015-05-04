#show_category.feature
Feature: Show Categories
As an IT staff member
I want to see a list of Categories
So that the I know what categories will show up in form of the  facility members so they can view and submit tickets

Scenario: Show Categories
Given I am an admin user
When I go to the sign in page
And I fill in "Email" with "name@test.com"
And I fill in "Password" with "password1"
And I press "Log in"
And I have categories name electricity, cars
And I go to the list of categories
Then I should see "electricity"
And I should see "cars"

Scenario: Show Category
Given I am an admin user
When I go to the sign in page
And I fill in "Email" with "name@test.com"
And I fill in "Password" with "password1"
And I press "Log in"
And I have a category name electricity
And I go to the show category
Then I should see "electricity"
