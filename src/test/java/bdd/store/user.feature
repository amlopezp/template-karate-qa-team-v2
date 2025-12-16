Feature: Endpoint de user
  Scenario: Caso 1 user
    * def id = 10
    * def validateScheme = read('classpath:resources/json/schema/schemes.json')
    Given url "https://fakestoreapi.com"
    And path "users/" + id
    When method delete
    Then status 200
    And match response contains validateScheme.deleteUser


