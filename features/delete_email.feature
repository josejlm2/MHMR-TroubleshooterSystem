Feature: delete Email Entry
As an IT staff
So that I can remove a person from IT staff receiving an email
I want to be able to delete an email in the email table 

Scenario: delete Email Entry
  Given I am an admin user
  When I go to the sign in page
  And I fill in "Email" with "name@test.com"
  And I fill in "Password" with "password1"
  And I press "Log in"
  And I have no emails
  And I have a email name jack@yahoo.com
  And I am on the list of emails
  And I follow "Delete"
  Then I should have 0 emails
