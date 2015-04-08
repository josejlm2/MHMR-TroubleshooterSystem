Feature: delete Email Entry
As an IT staff
So that I can remove a person from IT staff receiving an email
I want to be able to delete an email in the email table 

Scenario: delete Email Entry
Given I have a email name jack@yahoo.com
And I am on the list of emails
When I follow "Delete"
Then I should have 0 emails
