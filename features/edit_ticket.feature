#edit_category.feature
Feature: edit Ticket
As an IT staff member
I want to edit a Ticket in the "Facility Troubleshooter" Database's ticket list
So that I may change a room number

Scenario: edit Ticket
Given I have a ticket requestor "John Doe" in room "241"
And I am on the edit ticket page
And I fill in "room" with "214"
And I press "save changes"
Then I should see "John Doe" in room "214"