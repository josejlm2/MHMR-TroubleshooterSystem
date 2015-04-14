Feature: edit email
As an IT staff
So that I know when a ticket is made
I want to be able to edit an email in the email table 

Scenario: edit Email
Given I have a email name jack@yahoo.com
And I am on the edit email page
And I fill in "email_email_address" with "erick@yahoo.com"
And I press "Save Changes"
Then I should see "erick@yahoo.com"

