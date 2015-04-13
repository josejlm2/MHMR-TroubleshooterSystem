Feature: Create Email Entry
  In order to when a ticket is made
  As an IT staff
  I want to be able to add a email in the email table 
Scenario:
  Given I have no emails
  When I am on list of emails
  When I follow "Create email"
  And I fill in "email" with "jack@yahoo.com"
  And I press "Save Changes"
  Then I should see "jack@yahoo.com"
  And I should have 1 email
