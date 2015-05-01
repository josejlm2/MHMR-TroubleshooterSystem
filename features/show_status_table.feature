#show_status_table.feature
Feature: Show Status Table
	As an IT staff
	So that I know the status of the tickets that need to be processed
	I want to be able to see the tickets in the status table 

Scenario: Show Status Table
	Given I have tickets 
	When I go to the list of tickets 
	Then I should see the status of the tickets
	And I should see "Jane Harris"

Scenario: Show Ticket Has Not Started
	Given I have a ticket that has just been requested
	When I go to the status table
	Then I should see that ticket has "Not Started"

Scenario: Show Ticket Is In Progress
	Given I have a ticket that is being taken care of
	When I go to the status table
	Then I should see that ticket has "In Progress"

Scenario: Show Ticket Is Closed
	Given I have a ticket that has been been processed
	When I go to the status table
	Then I should see that ticket has been "Closed"
