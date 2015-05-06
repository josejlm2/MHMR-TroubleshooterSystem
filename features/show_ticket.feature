Feature: Show Tickets
As an IT staff
So that I know all of the tickets that need to be processed
I want to be able to see the tickets in the ticket table 

Scenario: Show Tickets
  Given I am an admin user
  When I go to the sign in page
  And I fill in "Email" with "name@test.com"
  And I fill in "Password" with "password1"
  And I press "Log in"
  And I have a category name cars
  And I have a status name In Progress
  And I have a location name Bryan
  And I have tickets requestor John Doe, Jane Harris
  And I go to the list of tickets 
  Then I should have 2 ticket 

Scenario: Show Ticket
  Given I am an admin user
  When I go to the sign in page
  And I fill in "Email" with "name@test.com"
  And I fill in "Password" with "password1"
  And I press "Log in"
  And I have a category name cars
  And I have a status name In Progress
  And I have a location name Bryan
  And I have a ticket requestor John
  And I go to the list of tickets 
  Then I should have 1 ticket 
