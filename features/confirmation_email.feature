#confirmation_email.feature
Feature: Email Confirmation
As a facility staff
So that the staff can confirm ticket submission
I want to receive a confirmation email when I submit a ticket

Scenario: Confirm a ticket submission
  Given a clear email queue
  When I am on the list of tickets
  When I follow "Create ticket"
  And I fill in "Email" with "john@doe.com"
  And I press "Save Changes"
  Then I should have 1 ticket
  And I should have 1 confirmation e-mails sent
  And the confirmation e-mails should be sent to "john@doe.com"
  And the confirmation e-mails should have a subject of "Ticket Confirmation"
