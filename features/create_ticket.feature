#create_category.feature
Feature: Create Category
As an IT staff member
I want to add a Ticket to the "Facility Troubleshooter" Database's category list
So that I may add more tickets

Scenario: Create new Ticket
  Given I am an admin user
  When I go to the sign in page
  And I fill in "Email" with "name@test.com"
  And I fill in "Password" with "password1"
  And I press "Log in"
  And I have no tickets
  When I am on the list of tickets
  And I follow "Create ticket"
  And I fill in "Requestor" with "John Doe"
  And I fill in "Email" with "john@doe.com"
  And I press "Save Changes"
  Then I should see "John Doe"
  And I should have 1 ticket
