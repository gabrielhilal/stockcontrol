Feature: Log in

  In order to get access to the application
  As a user
  I want to log in into the system

  Background:
    Given I exist as a "user"
    And I'm in the "login" page

  Scenario: User logs in successfully
    When I fill in "username" with "user"
    And I fill in "password" with "secret"
    And I press "Login"
    Then I should see "Welcome user"
    And I should be redirected to the "users" page

  Scenario: User enters wrong email/password combination
    When I fill in "username" with "user"
    And I fill in "password" with "wrongpassword"
    And I press "Login"
    Then I should see "Invalid username/password combination."
    And I should be redirected to the "login" page
