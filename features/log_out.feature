Feature: Log out

  In order to avoid people to access the application on my device
  As a user
  I want to log out from the system

  Scenario: User logs out successfully
    Given I am logged in as the "user"
    When I press "Logout"
    Then I should see "Logged out"
    And I should be redirected to the "login" page
