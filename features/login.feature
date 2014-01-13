Feature: Login
  As a user I'll be able to add wordpress hosted blogs. To authenticate,
  I'll provide email and password. I'll see appropriate error messages
  if I enter a bad username and password combination.

  @invalid_login @reinstall
  Scenario: Invalid login to MyPass
    Given I am about to login
    When I enter invalid credentials
    Then I am presented with an error message to correct credentials

  @valid_login @reinstall
  Scenario: Valid login to MyPass
    Given I am about to login
    When I enter valid credentials
    Then I am presented with an main page