Feature: Manage Users

  In order to provide access to users into the application
  As the owner
  I want to create and manage users

  Background:
    Given I am logged in as the "owner"

  Scenario: List all users
    And the users with roles bartender, director, manager exist
    When I go to the "users" page
    Then I should see "bartender"
    And I should see "director"
    And I should see "manager"

  Scenario: Create a new user successfully
    When I go to the "users/new" page
    And I fill in "Username" with "newuser"
    And I select "bartender" from the list
    And I fill in "Password" with "secret"
    And I fill in "Password confirmation" with "secret"
    And I press "Create User"
    Then I should see "User newuser create"
    And I should be redirected to the "users" page

  Scenario: Fail to create a new user without username
    And I am creating a new user without a username
    When I press "Create User"
    Then I should see "Username can't be blank"

  Scenario: Fail to create a new user without role
    And I am creating a new user without a role
    When I press "Create User"
    Then I should see "Role can't be blank"

  Scenario: Change the role of an existing user
    And I see the user "bartender" with the "bartender" role
    When I press "Edit"
    And I change the role to "supervisor"
    Then I should see "User bartender updated"
    And I should be redirected to the "users" page
    And I should see "supervisor"

  Scenario: Delete existing user
    And I see the user "bartender" with the "bartender" role
    When I press "Delete"
    Then I should see "User bartender deleted"
    And I should be redirected to the "users" page
