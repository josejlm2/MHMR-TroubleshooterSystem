#create_category.feature
Feature: Create Category
As an IT staff member
I want to add a Ticket to the "Facility Troubleshooter" Database's category list
So that I may add more tickets

Scenario: Create new Ticket
  Given I have no tickets
  When I am on the list of tickets
  When I follow "Create ticket"
  And I fill in "requestor" with "John Doe"
  And I press "Save Changes"
  Then I should see "John Doe"
  And I should have 1 ticket