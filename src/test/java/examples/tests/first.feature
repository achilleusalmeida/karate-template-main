Feature: sample api test script

  Background:
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'

  Scenario: Test a sample GET API
    Given url 'https://reqres.in/api/users?page=2'
    When method get
    Then status 200

  # With Background  and Path
  Scenario: Get demo 2
    Given path '/users/2'
    When method GET
    Then status 200

  #  With Background, path and params
  Scenario: Get demo 3
    Given path '/users'
    And param page = 2
    When method GET
    Then status 200

  #  With Assertions
  Scenario: Get demo 4
    Given path '/users'
    And param page = 2
    When method GET
    Then status 200
    And match response.data[0].first_name != null
    And assert response.data.length == 6
    And match $.data[1].id == 8
    And match $.data[3].last_name == 'Fields'
