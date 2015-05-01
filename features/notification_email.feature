#notification_email.feature
Feature: Receive an email notification
As a facility manager
So that the facility manager can be alerted
I want to receive an email notification when entries are added to the "Facility Troubleshooter" Database

Scenario: Confirm ticket notifications
  Given a clear email queue
  When I am on the list of tickets
  When I follow "Create ticket"
  And I fill in "Email" with "john@doe.com"
  And I press "Save Changes"
  Then I should have 1 ticket
  And I should have a notification email sent for each facility manager
  And the notification emails should be sent to each facility manager
  And the notification emails should have a subject of "Ticket Notification"