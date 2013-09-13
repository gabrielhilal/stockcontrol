Feature: Venues (CRUD)
	In order to manage the Lost Group's venues
 	As a director
 	I want to create, read, update and delete venues

  Background:
    Given I am logged in as the "director"

  Scenario: Create a New Venue
    Given I go to the "venues/new" page
    And I fill in "Name" with "Lost Society"
    And I fill in "Telephone" with "0207 652 6526"
    And I fill in "Email" with "info@lostsociety.co.uk"
    When I press "Create Venue"
    Then I should see "Venue Lost Society created"
    And I should be redirected to the "venues" page

  Scenario: Fail to Create a New Venue without a Name
     Given I go to the "venues/new" page
     And I fill in "Telephone" with "0207 652 6526"
     And I fill in "Email" with "info@lostsociety.co.uk"
     When I press "Create Venue"
     Then I should see "Name can't be blank"
