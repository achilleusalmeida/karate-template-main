Feature: sample post karate test script
for help, see: https://github.com/karatelabs/karate/wiki/IDE-Support

  Background:
    * url 'https://api.restful-api.dev'
    * header Accept = 'application/json'

  # Simple Post scenario
  Scenario: Post Add Object
    Given url 'https://api.restful-api.dev/objects'
    And request
      """
      {
        "name": "Apple MacBook Pro 16",
        "data": {
          "year": 2019,
          "price": 1849.99,
          "CPU model": "Intel Core i9",
          "Hard disk size": "1 TB"
        }
      }
      """
    When method post
    Then status 200

  # Post scenario with Background
  Scenario: Post Add Object with Background
    Given path '/objects'
    And request
      """
      {
        "name": "Apple MacBook Pro 16",
        "data": {
          "year": 2019,
          "price": 1849.99,
          "CPU model": "Intel Core i9",
          "Hard disk size": "1 TB"
        }
      }
      """
    When method post
    Then status 200

  # Post with response assertion
  Scenario: Post Add Object with response assertion
    Given path '/objects'
    And request
      """
      {
        "name": "Apple MacBook Pro 16",
        "data": {
          "year": 2019,
          "price": 1849.99,
          "CPU model": "Intel Core i9",
          "Hard disk size": "1 TB"
        }
      }
      """
    When method post
    Then status 200
    And match response ==
      """
      {
        "id": "#string",
        "name": "Apple MacBook Pro 16",
        "data": {
          "year": 2019,
          "price": 1849.99,
          "CPU model": "Intel Core i9",
          "Hard disk size": "1 TB"
        },
        "createdAt": "#ignore"
      }
      """

  # Post Add Object with response matching from a file
  Scenario: Post Add Object with response matching from a file
    Given path '/objects'
    And def expectedOutput = read('classpath:/data/addObjectResponse.json')
    And request
      """
      {
        "name": "Apple MacBook Pro 16",
        "data": {
          "year": 2019,
          "price": 1849.99,
          "CPU model": "Intel Core i9",
          "Hard disk size": "1 TB"
        }
      }
      """
    When method post
    Then status 200
    And match response == expectedOutput

  # Post read Add Object request data from file and change request values
  Scenario: Read Add Object request data from file and change request values
    Given path '/objects'
    And def requestBody = read('classpath:/data/addObjectRequest.json')
    And request requestBody
    When method post
    Then status 200
    And match response ==
      """
      {
        "id": "#string",
        "name": "Apple MacBook Pro 16",
        "data": {
          "year": 2019,
          "price": 1849.99,
          "CPU model": "Intel Core i9",
          "Hard disk size": "1 TB"
        },
        "createdAt": "#ignore"
      }
      """