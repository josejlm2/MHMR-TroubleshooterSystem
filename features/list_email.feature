Feature: list emails
As an IT staff
So that I know who is receiving the tickets
I want to be able to see the entries in the email table 

Scenario: List emails
  Given I am an admin user
  When I go to the sign in page
  And I fill in "Email" with "name@test.com"
  And I fill in "Password" with "password1"
  And I press "Log in"
  And I have emails name jack@yahoo.com, bob@live.com
  And I go to the list of emails
  Then I should see "jack@yahoo.com"
  And I should see "bob@live.com"
