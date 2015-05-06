#notification_email.feature
Feature: Receive an email notification
As a facility manager
So that the facility manager can be alerted
I want to receive an email notification when entries are added to the "Facility Troubleshooter" Database

Scenario: Confirm ticket notifications
  Given I am an admin user
  When I go to the sign in page
  And I fill in "Email" with "name@test.com"
  And I fill in "Password" with "password1"
  And I press "Log in"
  And a clear email queue
  And I have a category name cars
  And I have a status name Completed
  And I have a location name Bryan
  And I am on the list of tickets
  And I follow "Add Button"
  And I fill in "Requestor" with "John Doe"
  And I fill in "Email" with "john@doe.com"
  And I fill in "Subject" with "Help"
  And I fill in "Phone Number" with "555 555 5555"
  And I fill in "Description" with "Help Me"
  And I press "Save Changes"
  Then I should have 1 ticket
  And I should have a notification email sent for each facility manager
  And the notification emails should be sent to each facility manager
  And the notification emails should have a subject of "Ticket Notification"
