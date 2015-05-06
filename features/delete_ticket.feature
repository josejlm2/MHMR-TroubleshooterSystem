
#delete_ticket.feature
Feature: edit Ticket
As an IT staff member
I want to delete a Ticket in the "Facility Troubleshooter" Database's ticket list
So that I may not use it

Scenario: delete Ticket
  Given I am an admin user
  When I go to the sign in page
  And I fill in "Email" with "name@test.com"
  And I fill in "Password" with "password1"
  And I press "Log in"
  And I have no tickets
  And I have a category name cars
  And I have a status name In Progress
  And I have a location name Bryan
  And I have a ticket requestor John Doe
  And I am on the list of tickets
  And I follow "Delete"
  Then I should have 0 tickets
