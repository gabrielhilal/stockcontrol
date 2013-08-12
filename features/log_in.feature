Feature: Log in

  In order to get access to the application
  As a user
  I want to log in

  Scenario: User logs in successfully
    Given I exist as a user
    When I go to the login page
    And I fill in "username" with "gabrielhilal"
    And I fill in "password" with "secret"
    And I press "Login"
    And I should see "Welcome gabrielhilal"
    And I should be redirected to the home page


  Scenario: User enters wrong email/password combination
    Given I exist as a user
    When I go to the login page
    And I fill in "username" with "gabrielhilal"
    And I fill in "password" with "wrongpassword"
    And I press "Login"
    And I should see "Invalid username/password combination."
    And I should see the login page again
