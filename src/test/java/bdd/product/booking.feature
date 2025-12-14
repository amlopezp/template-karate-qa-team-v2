Feature: Casos de Booking

  Background:
    * def responseLogin = call read ('classpath:bdd/auth/loginAuth.feature@login-exitoso')
    ##* print responseLogin.authToken
    * def authToken = responseLogin.authToken
    Given url urlBase

    @prueba
  Scenario: Caso 1 - Update booking
    * def id = 804
    And path "booking/" + id
    And header Accept = "application/json"
    And header Cookie = "token=" + authToken
    And request read('classpath:resources/json/product/bodyBooking.json')
    When method put
    Then status 200

  Scenario: Caso 2 - delete booking v2
    * def id = 804
    And path "booking/" + id
    And header Accept = "application/json"
    And header Cookie = "token=" + authToken
    When method delete
    Then status 201
