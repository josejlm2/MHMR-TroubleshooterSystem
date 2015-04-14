Feature: Show Tickets
As an IT staff
So that I know all of the tickets that need to be processed
I want to be able to see the tickets in the ticket table 

Scenario: Show Tickets
Given I have tickets requestor John Doe, Jane Harris
When I go to the list of tickets 
Then I should see "John Doe"
And I should see "Jane Harris"

Scenario: Show Ticket
Given I have a ticket requestor John
When I go to the show ticket
Then I should see "John"