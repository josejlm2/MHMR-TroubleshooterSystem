
#delete_ticket.feature
Feature: edit Ticket
As an IT staff member
I want to delete a Ticket in the "Facility Troubleshooter" Database's ticket list
So that I may not use it

Scenario: delete Ticket
Given I have a ticket requestor John Doe in room 218
And I am on the list of tickets
When I follow "Delete"
Then I should have 0 tickets