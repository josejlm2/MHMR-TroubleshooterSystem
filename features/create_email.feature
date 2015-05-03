Feature: Create Email Entry
  In order to when a ticket is made
  As an IT staff
  I want to be able to add a email in the email table 
Scenario:
  Given I am an admin user
  When I go to the sign in page
  And I fill in "Email" with "name@test.com"
  And I fill in "Password" with "password1"
  And I press "Log in"
  And I have no emails
  And I am on the list of emails
  And I follow "Add Button"
  And I fill in "email_email_address" with "jack@yahoo.com"
  And I press "Save Changes"
  Then I should see "jack@yahoo.com"
  And I should have 1 email
