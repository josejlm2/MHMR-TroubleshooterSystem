#confirmation_email.feature
Feature: Email Confirmation
As a facility staff
So that the staff can confirm ticket submission
I want to receive a confirmation email when I submit a ticket

Scenario: Confirm a ticket submission
  Given I am an admin user
  When I go to the sign in page
  And I fill in "Email" with "name@test.com"
  And I fill in "Password" with "password1"
  And I press "Log in"
  And I have a category name cars
  And I have a status name In Progress
  And I have a location name Bryan
  And a clear email queue
  And I am on the list of tickets
  And I follow "Add Button"
  And I fill in "Requestor" with "John Doe"
  And I fill in "Email" with "john@doe.com"
  And I fill in "Subject" with "Help"
  And I fill in "Phone Number" with "555 555 5555"
  And I fill in "Description" with "Help Me"
  And I press "Create Ticket"
  Then I should have 1 ticket
  And I should have 1 confirmation e-mails sent
  And the confirmation e-mails should be sent to "john@doe.com"
  And the confirmation e-mails should have a subject of "Ticket Confirmation"
